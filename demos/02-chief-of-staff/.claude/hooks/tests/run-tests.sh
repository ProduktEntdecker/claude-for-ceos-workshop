#!/usr/bin/env bash
# run-tests.sh: checks the trust guard against JSON fixtures.
#
# Usage (from any folder): bash demos/02-chief-of-staff/.claude/hooks/tests/run-tests.sh
#
# The fixture name says what must happen:
#   allow-*.json  the guard lets the write through (exit 0, no message)
#   block-*.json  the guard blocks it (exit 2, message points to TRUST-LEVELS.md)
#   block-*.txt   same, for input that is not valid JSON
# The placeholder __ROOT__ is replaced by a temporary copy of the demo folder,
# so the tests never touch the real files. Two extra tests run the guard in
# place, and two check that .claude/settings.json wires it up.

set -uo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEMO_DIR="$(cd "$TESTS_DIR/../../.." && pwd)"
HOOK_SRC="$DEMO_DIR/.claude/hooks/trust-guard.sh"
SETTINGS="$DEMO_DIR/.claude/settings.json"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required to run these tests." >&2
  exit 1
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

ROOT="$TMP_DIR/demo"
case "$ROOT" in
  *'#'* | *'&'* | *\\*)
    echo "Unsupported temporary path: $ROOT" >&2
    exit 1
    ;;
esac
mkdir -p "$ROOT/.claude/hooks" "$ROOT/out/drafts" "$ROOT/notes"
cp "$HOOK_SRC" "$ROOT/.claude/hooks/trust-guard.sh"
printf '# note\n' >"$ROOT/notes/source.md"
ln -s ../notes "$ROOT/out/escape"
ln -s ../notes/source.md "$ROOT/out/linked-note.md"

PASS=0
FAIL=0
HOOK_EXIT=0
HOOK_STDERR=""

pass() {
  PASS=$((PASS + 1))
  printf 'PASS  %s\n' "$1"
}

fail() {
  FAIL=$((FAIL + 1))
  printf 'FAIL  %s: %s\n' "$1" "$2"
}

# check NAME EXPECTED_EXIT HOOK INPUT
check() {
  HOOK_STDERR="$(printf '%s' "$4" | bash "$3" 2>&1 >/dev/null)"
  HOOK_EXIT=$?
  if [ "$HOOK_EXIT" -ne "$2" ]; then
    fail "$1" "expected exit $2, got $HOOK_EXIT"
    return
  fi
  if [ "$2" -eq 2 ] && ! printf '%s' "$HOOK_STDERR" | grep -q 'TRUST-LEVELS.md'; then
    fail "$1" "blocked, but the message does not point to TRUST-LEVELS.md"
    return
  fi
  if [ "$2" -eq 0 ] && [ -n "$HOOK_STDERR" ]; then
    fail "$1" "allowed, but printed a message: $HOOK_STDERR"
    return
  fi
  pass "$1"
}

echo "Trust guard tests"
echo

shopt -s nullglob
fixtures=("$TESTS_DIR"/fixtures/*.json "$TESTS_DIR"/fixtures/*.txt)
if [ "${#fixtures[@]}" -eq 0 ]; then
  echo "No fixtures found in $TESTS_DIR/fixtures" >&2
  exit 1
fi

for fixture in "${fixtures[@]}"; do
  file_name="$(basename "$fixture")"
  name="${file_name%.*}"
  case "$name" in
    allow-*) expected=0 ;;
    block-*) expected=2 ;;
    *)
      fail "$name" "fixture names must start with allow- or block-"
      continue
      ;;
  esac
  input="$(sed "s#__ROOT__#$ROOT#g" "$fixture")"
  case "$file_name" in
    *.json)
      if ! printf '%s' "$input" | jq -e . >/dev/null 2>&1; then
        fail "$name" "fixture is not valid JSON"
        continue
      fi
      ;;
  esac
  check "$name" "$expected" "$ROOT/.claude/hooks/trust-guard.sh" "$input"
done

# The guard in its real place: decides only, writes nothing.
in_place_input() {
  jq -n --arg cwd "$DEMO_DIR" --arg path "$1" \
    '{hook_event_name: "PreToolUse", cwd: $cwd, tool_name: "Write", tool_input: {file_path: $path, content: "test"}}'
}
check "in-place-allow-out" 0 "$HOOK_SRC" "$(in_place_input "$DEMO_DIR/out/tasks.md")"
check "in-place-block-notes" 2 "$HOOK_SRC" "$(in_place_input "$DEMO_DIR/notes/M1-2026-09-14-management-team-weekly.md")"

# The settings must call the guard for Write and Edit and switch off the shell.
if jq -e '[.hooks.PreToolUse[]?
          | select((.matcher // "") | (test("Write") and test("Edit")))
          | .hooks[]?
          | select(.type == "command" and (.command | contains("trust-guard.sh")))]
          | length > 0' "$SETTINGS" >/dev/null 2>&1; then
  pass "settings-wire-the-guard"
else
  fail "settings-wire-the-guard" "$SETTINGS does not run trust-guard.sh for Write and Edit"
fi
if jq -e '.permissions.deny | index("Bash")' "$SETTINGS" >/dev/null 2>&1; then
  pass "settings-deny-shell"
else
  fail "settings-deny-shell" "$SETTINGS does not deny the Bash tool"
fi

echo
echo "$PASS passed, $FAIL failed"
[ "$FAIL" -eq 0 ]
