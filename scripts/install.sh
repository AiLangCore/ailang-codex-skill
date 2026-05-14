#!/usr/bin/env sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
DEST_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"
DEST="$DEST_ROOT/ailang"

mkdir -p "$DEST_ROOT"
rm -rf "$DEST"
cp -R "$ROOT/ailang" "$DEST"

cat <<EOF
Installed AiLang Codex skill:
  $DEST

Use it in Codex:
  Use \$ailang to create a new AiLang project named MyApp and run it.
EOF
