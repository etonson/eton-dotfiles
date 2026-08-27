#!/usr/bin/env bash
set -euo pipefail

SRV_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"
ln -sfn "$SRV_DIR/bin/srv" "$BIN_DIR/srv"
chmod +x "$SRV_DIR/bin/srv"
printf 'Installed srv -> %s\n' "$SRV_DIR/bin/srv"
case ":$PATH:" in *":$BIN_DIR:"*) ;; *) printf 'Add %s to PATH.\n' "$BIN_DIR" ;; esac
