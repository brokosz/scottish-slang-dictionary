# Scottish Slang Dictionary for macOS

A custom macOS Dictionary.app dictionary containing 450+ Scottish slang terms and jargon, sourced from the Wiktionary Glossary of Scottish Slang and Jargon.

Works with macOS Dictionary.app, three-finger tap lookup, and Spotlight.

![Scottish Slang Dictionary](https://img.shields.io/badge/macOS-Dictionary-blue) ![Entries](https://img.shields.io/badge/entries-450%2B-green)

---

## Requirements

- macOS (tested on macOS 26 Tahoe)
- [Dictionary Development Kit](https://developer.apple.com/download/all/?q=Additional%20Tools) — install from **Additional Tools for Xcode** DMG

## Install the DDK

1. Download **Additional Tools for Xcode** from [developer.apple.com/download/all](https://developer.apple.com/download/all/?q=Additional%20Tools)
2. Mount the DMG
3. Copy the DDK to your Library:

```bash
cp -r "/Volumes/Additional Tools/Utilities/Dictionary Development Kit" ~/Library/
```

## Build & Install

```bash
git clone https://github.com/YOUR_USERNAME/scottish-slang-dictionary.git
cd scottish-slang-dictionary
make
bash patch_and_install.sh
```

Then open **Dictionary.app → Settings** and enable **Scottish Slang**.

## Usage

- Open Dictionary.app and search any term
- Highlight a word anywhere in macOS and three-finger tap (or Force Touch) to look it up
- Works in the macOS lookup popup across all apps

## Sample Entries

| Term | Definition |
|------|-----------|
| aye | yes |
| bawbag | scrotum; pejorative |
| baltic | freezing cold |
| braw | good looking, beautiful; really nice |
| dreich | damp, overcast, wet |
| eejit | idiot |
| gallus | bold, cheeky, or flashy |
| greet | to cry |
| Hogmanay | New Year's Eve |
| numpty | an endearing term; lovable idiot |
| pure | very; totally. Used to emphasise something |
| scunnered | bored, fed up, exhausted |
| wheesht | be quiet |
| yaldi | an expression of deep joy |

## macOS 26 Compatibility Note

The Dictionary Development Kit generates a `DCSDictionaryLanguages` plist entry as a plain string array, which causes Dictionary.app to crash on macOS 26 (Tahoe). The `patch_and_install.sh` script fixes this by converting the entry to the dict format that macOS 26 expects, then installs the dictionary.

## Files

- `ScottishSlang.xml` — dictionary source (450+ entries in Apple Dictionary XML format)
- `ScottishSlang.css` — stylesheet
- `ScottishSlang.plist` — dictionary metadata
- `Makefile` — builds the dictionary using the DDK
- `patch_and_install.sh` — patches the built plist for macOS 26 compatibility and installs

## Sources

Entries sourced from [Wiktionary: Glossary of Scottish slang and jargon](https://en.wiktionary.org/wiki/Appendix:Glossary_of_Scottish_slang_and_jargon), which is available under the [Creative Commons Attribution-ShareAlike License](https://creativecommons.org/licenses/by-sa/4.0/).

## License

Content: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
Build tooling: MIT
