#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://github.com/elixir-lang/expert/releases/download/nightly"
DEST_DIR="./elixir"

ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

case "$ARCH" in
  arm64|aarch64)
    ARCH_TAG="arm64"
    ;;
  x86_64|amd64)
    ARCH_TAG="x86_64"
    ;;
  *)
    echo "❌ Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

FILENAME="expert_${OS}_${ARCH_TAG}"
URL="$BASE_URL/$FILENAME"
DEST_FILE="$DEST_DIR/$FILENAME"

mkdir -p "$DEST_DIR"

echo "⬇️  Downloading $URL -> $DEST_FILE"
curl -L "$URL" -o "$DEST_FILE"

chmod +x "$DEST_FILE"

echo "✅ Done. Binary saved at $DEST_FILE"
