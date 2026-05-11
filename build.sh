#!/bin/bash
# Scottish Slang Dictionary Builder
# Requires Apple Dictionary Development Kit (DDK)
# Download from: https://developer.apple.com/download/all/?q=Additional%20Tools
# Look for "Additional Tools for Xcode" and install it.
# The DDK will be at: /Developer/Extras/Dictionary Development Kit/

DDK="/Developer/Extras/Dictionary Development Kit"
DICT_NAME="Scottish Slang"
BUILD_TOOL="$DDK/bin/build_dict.sh"

if [ ! -f "$BUILD_TOOL" ]; then
    echo "ERROR: Dictionary Development Kit not found at $DDK"
    echo "Download 'Additional Tools for Xcode' from https://developer.apple.com/download/all/"
    exit 1
fi

echo "Building Scottish Slang Dictionary..."
"$BUILD_TOOL" "$DICT_NAME" ScottishSlang.xml ScottishSlang.css Info.plist

if [ $? -eq 0 ]; then
    echo ""
    echo "Build successful!"
    echo ""
    echo "To install, copy the dictionary to your Library:"
    echo "  cp -r \"objects/$DICT_NAME.dictionary\" ~/Library/Dictionaries/"
    echo ""
    echo "Then open Dictionary.app > Preferences and enable 'Scottish Slang'."
else
    echo "Build failed."
fi
