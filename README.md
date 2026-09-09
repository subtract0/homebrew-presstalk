# PressTalk for Homebrew

The cask follows the public, Developer ID signed and Apple-notarized release at
[presstalk.app](https://presstalk.app/download.html). It requires Apple Silicon
and macOS 14 or later.

For a new Homebrew installation:

```bash
brew tap subtract0/presstalk
brew install --cask presstalk
```

Open PressTalk and complete its setup. Choose F5 or another supported shortcut
if your keyboard does not expose the Mac Fn / Globe key. The speech model is
approximately 460 MB. The first recording after connecting AirPods can require
a retry; see the [download page](https://presstalk.app/download.html).

For an existing Homebrew installation, quit PressTalk first, then run:

```bash
brew update
brew upgrade --cask presstalk
```

If you installed the app directly, keep using the
[DMG download](https://presstalk.app/download.html) and replace your existing
app in the same Applications folder. Keep one installed copy. Do not delete
preferences or your licence to update.

The cask installs the released app. It does not run setup scripts, change
permissions, remap keys, or modify the system microphone selection.
