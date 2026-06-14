cask "presstalk" do
  version "0.1.6-test8"
  sha256 "e222363c9093da4c434dcbadd9c718aa0a9608beaf2bce1bbf7b3ccbec7de3e6"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.6-test8/PressTalk-0.1.6-test8-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://github.com/subtract0/presstalk-releases"

  depends_on macos: :sonoma

  app "PressTalk.app"

  postflight do |c|
    c.system_command "/usr/bin/env",
                     args: [
                       "PRESSTALK_AUTO_SHOW_SETUP_WINDOW=1",
                       "PRESSTALK_OPEN_PERMISSION_PANES=1",
                       "PRESSTALK_BOOTSTRAP_STABLE_SIGNING=0",
                       "/bin/bash",
                       "#{appdir}/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh",
                     ],
                     must_succeed: false
  end

  caveats <<~EOS
    PressTalk defaults to the native Fn / Globe push-to-talk trigger.
    On first launch, PressTalk opens a compact setup window for Microphone,
    Input Monitoring, and Accessibility. Approve those three macOS permissions.
    If you need to rerun setup manually, use:
      PRESSTALK_AUTO_SHOW_SETUP_WINDOW=1 PRESSTALK_OPEN_PERMISSION_PANES=1 PRESSTALK_BOOTSTRAP_STABLE_SIGNING=0 /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh
    If you choose the optional F5 trigger and need the Karabiner bridge, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-karabiner-fallback.sh --enable
  EOS
end
