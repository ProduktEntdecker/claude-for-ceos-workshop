#!/bin/bash
# Regression tests for scripts/hooks/pre-commit.
# Run from anywhere: bash scripts/hooks/test-pre-commit.sh
# Fake secrets are assembled at runtime, so this file never matches a pattern itself.

set -u

HOOK="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/pre-commit"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
REPO="$TMP/repo"
total=0
failed=0

repeat() {
    local out="" i
    for ((i = 0; i < $2; i++)); do out+="$1"; done
    printf '%s' "$out"
}

new_repo() {
    rm -rf "$REPO"
    mkdir -p "$REPO"
    git -C "$REPO" init -q
    git -C "$REPO" config user.email test@example.com
    git -C "$REPO" config user.name Test
}

stage() {
    printf '%s\n' "$2" > "$REPO/$1"
    git -C "$REPO" add "$1"
}

# check WANT NAME [VALUE_THAT_MUST_NOT_APPEAR_IN_OUTPUT]
check() {
    local want=$1 name=$2 forbidden=${3:-} out rc got
    total=$((total + 1))
    out=$(cd "$REPO" && bash "$HOOK" 2>&1)
    rc=$?
    got=pass
    [ "$rc" -ne 0 ] && got=block
    if [ "$got" != "$want" ]; then
        echo "  FAIL  [want $want, got $got] $name"
        failed=$((failed + 1))
    elif [ -n "$forbidden" ] && printf '%s' "$out" | grep -qF -- "$forbidden"; then
        echo "  FAIL  [output leaks the matched value] $name"
        failed=$((failed + 1))
    else
        echo "  ok    [$want] $name"
    fi
}

key_value=$(repeat a 28)
fake_key="api_""key = \"$key_value\""
fake_ant="sk-ant-""api03-$(repeat x 30)"
fake_pem="-----BEGIN RSA ""PRIVATE KEY-----"
fake_mail="jane.doe@""gmail.com"
ok_mail="elena.vilaro@""sotarena.example"
fake_iban="DE""89370400440532013000"

new_repo; stage notes.md "Secrets live in .env (ignored by git)."
check pass "prose that mentions secrets"

new_repo; stage config.txt "$fake_key"
check block "generic API key, value not printed" "$key_value"

new_repo; stage key.txt "$fake_ant"
check block "Anthropic key, value not printed" "$fake_ant"

new_repo; stage id.txt "$fake_pem"
check block "private key header (pattern starts with dashes)"

new_repo; stage contact.md "Write to $fake_mail"
check block "real e-mail address, value not printed" "$fake_mail"

new_repo; stage contact.md "Write to $ok_mail"
check pass "e-mail on the reserved .example domain"

new_repo; stage bank.md "IBAN $fake_iban"
check block "German IBAN, value not printed" "$fake_iban"

new_repo; stage config.txt "$fake_key"
git -C "$REPO" commit -qm init
printf 'clean\n' > "$REPO/config.txt"
git -C "$REPO" add config.txt
check pass "removing a secret does not block"

new_repo; stage "Notizen München.md" "Write to $fake_mail"
check block "file name with umlaut is still scanned"

new_repo; stage .env "TOKEN=1"
check block "sensitive file name"

new_repo; cp "$HOOK" "$REPO/hook-copy"; git -C "$REPO" add hook-copy
check pass "the hook file itself passes its own scan"

new_repo; cp "${BASH_SOURCE[0]}" "$REPO/test-copy"; git -C "$REPO" add test-copy
check pass "this test file passes the scan"

echo
if [ "$failed" -eq 0 ]; then
    echo "All $total cases passed."
    exit 0
fi
echo "$failed of $total cases failed." >&2
exit 1
