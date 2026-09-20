#!/usr/bin/env bash
# trust-guard.sh: PreToolUse hook for demo 2 (chief of staff with trust levels).
#
# Claude Code runs this script before every Write, Edit, MultiEdit or
# NotebookEdit call and passes the planned tool call as JSON on stdin.
# A write is allowed only if its target lies inside the out/ folder of this
# demo. Everything else is blocked with exit code 2: Claude Code cancels the
# tool call and shows the message on stderr to Claude.
#
# Fail closed: if the input cannot be read or a check cannot be completed,
# the write is blocked. Exit code 2 is the only code that blocks; any other
# non-zero code would let the write through. That is why this script does not
# use "set -e" and ends every failure path with an explicit block.
#
# Requires: bash 3.2 or later, jq.

HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
DEMO_ROOT=""
DEMO_ROOT_PHYSICAL=""
if [ -n "$HOOK_DIR" ]; then
  DEMO_ROOT="$(cd "$HOOK_DIR/../.." 2>/dev/null && pwd)"
  DEMO_ROOT_PHYSICAL="$(cd "$HOOK_DIR/../.." 2>/dev/null && pwd -P)"
fi

# block TOOL PATH REASON: print a plain-language message and stop the write.
block() {
  local shown="$2"
  if [ -n "$DEMO_ROOT" ]; then
    shown="${shown#"$DEMO_ROOT"/}"
  fi
  if [ -n "$DEMO_ROOT_PHYSICAL" ]; then
    shown="${shown#"$DEMO_ROOT_PHYSICAL"/}"
  fi
  {
    echo "BLOCKED by the trust levels of this demo (see TRUST-LEVELS.md)."
    echo "The AI chief of staff may only write inside the out/ folder."
    echo "Requested: ${1:-unknown tool} on ${shown:-an unknown file}"
    if [ -n "$3" ]; then
      echo "Reason: $3"
    fi
    echo "Instead: put the change into out/ (the task list, or a draft in out/drafts/) and tell Elena. Files outside out/ are changed by a person."
  } >&2
  exit 2
}

# normalize PATH: resolve "." and ".." without touching the file system.
normalize() {
  local part joined=""
  local -a parts
  local -a kept
  kept=()
  IFS='/' read -r -a parts <<< "$1"
  for part in "${parts[@]}"; do
    case "$part" in
      '' | '.') ;;
      '..')
        if [ "${#kept[@]}" -gt 0 ]; then
          unset "kept[$((${#kept[@]} - 1))]"
        fi
        ;;
      *) kept+=("$part") ;;
    esac
  done
  for part in "${kept[@]}"; do
    joined="$joined/$part"
  done
  printf '%s\n' "${joined:-/}"
}

# physical_path PATH: where PATH really leads, following links in the
# existing part of the path. The file itself may not exist yet.
physical_path() {
  local dir="$1" rest=""
  while [ ! -d "$dir" ]; do
    rest="/$(basename "$dir")$rest"
    dir="$(dirname "$dir")"
  done
  dir="$(cd "$dir" 2>/dev/null && pwd -P)" || return 1
  if [ "$dir" = "/" ]; then
    printf '%s\n' "${rest:-/}"
  else
    printf '%s%s\n' "$dir" "$rest"
  fi
}

if [ -z "$DEMO_ROOT" ] || [ -z "$DEMO_ROOT_PHYSICAL" ]; then
  block "" "" "the guard could not find its demo folder"
fi

if ! command -v jq >/dev/null 2>&1; then
  block "" "" "the guard needs the tool jq, which is not installed"
fi

INPUT="$(cat)"
if ! printf '%s' "$INPUT" | jq -e 'type == "object"' >/dev/null 2>&1; then
  block "" "" "the request could not be read"
fi

TOOL_NAME="$(printf '%s' "$INPUT" | jq -r '.tool_name // empty | strings')"
case "$TOOL_NAME" in
  Write | Edit | MultiEdit | NotebookEdit) ;;
  '') block "" "" "the request names no tool" ;;
  *) exit 0 ;; # not a file write, nothing to guard
esac

FILE_PATH="$(printf '%s' "$INPUT" | jq -r '(.tool_input.file_path // .tool_input.notebook_path // empty) | strings')"
CWD="$(printf '%s' "$INPUT" | jq -r '.cwd // empty | strings')"

if [ -z "$FILE_PATH" ]; then
  block "$TOOL_NAME" "" "the request names no file"
fi
case "$FILE_PATH" in
  *$'\n'*) block "$TOOL_NAME" "" "the file name contains a line break" ;;
esac
case "$CWD" in
  /*) ;;
  *) CWD="$DEMO_ROOT" ;;
esac

case "$FILE_PATH" in
  /*) TARGET="$(normalize "$FILE_PATH")" ;;
  *) TARGET="$(normalize "$CWD/$FILE_PATH")" ;;
esac

# 1. The path as written must point into out/ (not to out/ itself).
case "$TARGET" in
  "$DEMO_ROOT/out/"?* | "$DEMO_ROOT_PHYSICAL/out/"?*) ;;
  *) block "$TOOL_NAME" "$FILE_PATH" "" ;;
esac

# 2. The file itself must not be a link to somewhere else.
if [ -L "$TARGET" ]; then
  block "$TOOL_NAME" "$FILE_PATH" "the file is a link that points somewhere else"
fi

# 3. Where the path really leads must also be inside out/.
PHYSICAL="$(physical_path "$TARGET")" ||
  block "$TOOL_NAME" "$FILE_PATH" "the guard could not check where this path leads"
case "$PHYSICAL" in
  "$DEMO_ROOT_PHYSICAL/out/"?*) exit 0 ;;
esac

block "$TOOL_NAME" "$FILE_PATH" "the path leads through a link to a place outside out/"
