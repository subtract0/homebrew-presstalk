cask "presstalk" do
  version "0.1.4"
  sha256 "3e65073b8de9e8ce70a712c830af0c3fb714f1909ba7e0551ea7cc9b8e8ea8d5"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.4/PressTalk-0.1.4-macos-arm64.zip"
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
    PressTalk installs a dedicated F5 bridge and may also use the native path on Macs where it behaves correctly.
    After install, approve the macOS permission prompts from PressTalk and Karabiner-Elements.
    If you need to rerun setup manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh
    If you need to force the F5 bridge manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-karabiner-fallback.sh --enable
  EOS
end
