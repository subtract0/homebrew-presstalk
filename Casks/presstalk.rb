cask "presstalk" do
  version "0.1.11"
  sha256 "be98339c8f8e35811bd529c00589a04bc57647de70afa14ec84f66aace91e6dd"

  url "https://github.com/subtract0/presstalk/releases/download/v#{version}/PressTalk-#{version}-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://presstalk.app"

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
