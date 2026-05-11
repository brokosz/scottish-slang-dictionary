#!/bin/bash
# One-liner installer for Scottish Slang Dictionary
# Usage: curl -fsSL https://raw.githubusercontent.com/brokosz/scottish-slang-dictionary/main/install.sh | bash

set -e

REPO="brokosz/scottish-slang-dictionary"
DICT_NAME="Scottish Slang.dictionary"
DEST="$HOME/Library/Dictionaries"

echo "Fetching latest release..."
URL=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
  | grep "browser_download_url" \
  | grep "\.zip" \
  | cut -d '"' -f 4)

if [ -z "$URL" ]; then
  echo "Error: could not find a release asset to download."
  exit 1
fi

echo "Downloading $URL..."
TMP=$(mktemp -d)
curl -fsSL "$URL" -o "$TMP/dictionary.zip"

echo "Installing..."
unzip -q "$TMP/dictionary.zip" -d "$TMP"
mkdir -p "$DEST"
rm -rf "$DEST/$DICT_NAME"
cp -r "$TMP/$DICT_NAME" "$DEST/"
rm -rf "$TMP"

echo ""
echo "Done! Open Dictionary.app → Settings and enable 'Scottish Slang'."
