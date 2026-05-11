# Scottish Slang Dictionary for macOS

A custom macOS Dictionary.app dictionary containing 450+ Scottish slang terms and jargon, sourced from the Wiktionary Glossary of Scottish Slang and Jargon.

Works with Dictionary.app, three-finger tap lookup, and Spotlight.

![Build](https://github.com/brokosz/scottish-slang-dictionary/actions/workflows/build.yml/badge.svg) ![Entries](https://img.shields.io/badge/entries-450%2B-green) ![macOS](https://img.shields.io/badge/macOS-Dictionary-blue)

---

## Easy Install (no DDK required)

1. Download **Scottish Slang.dictionary.zip** from the [latest release](https://github.com/brokosz/scottish-slang-dictionary/releases/latest)
2. Unzip it
3. Copy to your Dictionaries folder:
```bash
cp -r "Scottish Slang.dictionary" ~/Library/Dictionaries/
```
4. Open **Dictionary.app → Settings** and enable **Scottish Slang**

---

## Build from Source

Requires the [Dictionary Development Kit](https://developer.apple.com/download/all/?q=Additional%20Tools) from Apple's Additional Tools for Xcode DMG.

### Install the DDK

```bash
# Mount the DMG, then:
cp -r "/Volumes/Additional Tools/Utilities/Dictionary Development Kit" ~/Library/
```

### Build & Install

```bash
git clone https://github.com/brokosz/scottish-slang-dictionary.git
cd scottish-slang-dictionary
make
bash patch_and_install.sh
```

---

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

## macOS 26 Compatibility

The Dictionary Development Kit generates a `DCSDictionaryLanguages` plist entry as a plain string, which causes Dictionary.app to crash on macOS 26 (Tahoe). The `patch_and_install.sh` script and the GitHub Actions workflow both fix this automatically by converting it to the dict format macOS 26 expects.

## Files

| File | Description |
|------|-------------|
| `ScottishSlang.xml` | Dictionary source — 450+ entries in Apple Dictionary XML format |
| `ScottishSlang.css` | Stylesheet |
| `ScottishSlang.plist` | Dictionary metadata |
| `Makefile` | Builds the dictionary using the DDK |
| `patch_and_install.sh` | Patches the built plist for macOS 26 and installs |
| `.github/workflows/build.yml` | GitHub Actions workflow — builds and attaches to releases |

## Sources

Entries sourced from [Wiktionary: Glossary of Scottish slang and jargon](https://en.wiktionary.org/wiki/Appendix:Glossary_of_Scottish_slang_and_jargon), available under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

## License

Content: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)  
Build tooling: MIT
