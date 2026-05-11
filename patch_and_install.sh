#!/bin/bash
set -e

DICT_OBJ=~/Downloads/scottish-slang-dictionary/objects/Scottish\ Slang.dictionary/Contents/Info.plist

echo "Patching Info.plist for macOS 26 compatibility..."

/usr/libexec/PlistBuddy -c "Delete :DCSDictionaryLanguages" "$DICT_OBJ"
/usr/libexec/PlistBuddy -c "Add :DCSDictionaryLanguages array" "$DICT_OBJ"
/usr/libexec/PlistBuddy -c "Add :DCSDictionaryLanguages:0 dict" "$DICT_OBJ"
/usr/libexec/PlistBuddy -c "Add :DCSDictionaryLanguages:0:DCSDictionaryDescriptionLanguage string en" "$DICT_OBJ"
/usr/libexec/PlistBuddy -c "Add :DCSDictionaryLanguages:0:DCSDictionaryIndexLanguage string en" "$DICT_OBJ"
/usr/libexec/PlistBuddy -c "Delete :DCSDictionaryPreferredDataLocation" "$DICT_OBJ" 2>/dev/null || true

echo "Installing..."
mkdir -p ~/Library/Dictionaries
ditto --noextattr --norsrc \
  ~/Downloads/scottish-slang-dictionary/objects/Scottish\ Slang.dictionary \
  ~/Library/Dictionaries/Scottish\ Slang.dictionary

echo ""
echo "Done! Open Dictionary.app → Settings and enable 'Scottish Slang'."
