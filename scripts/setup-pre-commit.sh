#!/bin/sh

HOOK_DIR=".git/hooks"
HOOK_FILE="$HOOK_DIR/pre-commit"
SOURCE_FILE="scripts/pre-commit"

echo "Setting up pre-commit hook..."

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found!"
    exit 1
fi

cp "$SOURCE_FILE" "$HOOK_FILE"
chmod +x "$HOOK_FILE"

echo "pre-commit hook installed and made executable successfully!"
