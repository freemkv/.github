#!/usr/bin/env bash
# Self-tests for leak-guard.sh. Each case builds a throwaway repo and checks
# the exit code plus a message fragment. Usage: bash ci/leak-guard-selftest.sh
set -uo pipefail

GUARD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/leak-guard.sh"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
# Built from pieces so this file does not itself trip the home-path net.
HOME_LEAK="/Us""ers/alice/Developer/x"
failed=0

mkrepo() {
  git init -q "$TMP/$1"
  printf 'hello\n' > "$TMP/$1/README.md"
}

# expect <name> <repo> <script> <want-exit> <want-output-fragment>
expect() {
  local out code
  out="$(cd "$TMP/$2" && git add -A && bash "$3" 2>&1)"; code=$?
  if [ "$code" -ne "$4" ] || ! grep -qF -- "$5" <<<"$out"; then
    printf 'FAIL %s: exit %s (want %s), want output containing "%s"\n%s\n' "$1" "$code" "$4" "$5" "$out"
    failed=1
  else
    printf 'ok   %s\n' "$1"
  fi
}

mkrepo outside
expect "script outside the scanned repo" outside "$GUARD" 0 "leak-guard: clean"

mkrepo leak
printf 'see %s\n' "$HOME_LEAK" >> "$TMP/leak/README.md"
expect "leak in an ordinary file" leak "$GUARD" 1 "README.md"

mkrepo selfclean
mkdir -p "$TMP/selfclean/ci" && cp "$GUARD" "$TMP/selfclean/ci/"
expect "own patterns do not self-flag" selfclean "$TMP/selfclean/ci/leak-guard.sh" 0 "leak-guard: clean"

mkrepo selfleak
mkdir -p "$TMP/selfleak/ci" && cp "$GUARD" "$TMP/selfleak/ci/"
printf '# built on %s\n' "$HOME_LEAK" >> "$TMP/selfleak/ci/leak-guard.sh"
expect "leak inside the guard script itself" selfleak "$TMP/selfleak/ci/leak-guard.sh" 1 "ci/leak-guard.sh"

[ "$failed" -eq 0 ] && echo "leak-guard selftest: all passed"
exit "$failed"
