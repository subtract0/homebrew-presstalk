cask "presstalk" do
  version "0.1.3"
  sha256 "9e4d20c188762f6a0537479eb943b5b1c69872b6257544f5e5f33ac525fa8fa4"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.3/PressTalk-0.1.3-macos-arm64.zip"
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
    The installer also pulls in Karabiner-Elements for the F5 / microphone-key bridge.
    After install, approve the macOS permission prompts from PressTalk and Karabiner-Elements.
    If you need to rerun setup manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh
  EOS
end
