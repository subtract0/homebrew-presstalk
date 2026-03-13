cask "presstalk" do
  version "0.1.5"
  sha256 "511b5bba47b98c49bb92e6ae8c4b8af4291acea4076a3c87836e510426a688b2"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.5/PressTalk-0.1.5-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://github.com/subtract0/presstalk-releases"

  depends_on macos: ">= :sonoma"
  depends_on cask: "karabiner-elements"

  app "PressTalk.app"

  postflight do |c|
    c.system_command "/bin/bash",
                     args: ["#{appdir}/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh"],
                     must_succeed: false
  end

  caveats <<~EOS
    PressTalk installs a dedicated F5 bridge for reliable interception.
    After install, approve the macOS permission prompts from PressTalk and Karabiner-Elements.
    If you need to rerun setup manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh
    If you need to force the F5 bridge manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-karabiner-fallback.sh --enable
  EOS
end
