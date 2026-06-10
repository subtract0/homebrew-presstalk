cask "presstalk" do
  version "0.1.6-test4"
  sha256 "5d8327dc06da388679125aaf831dc35736c67c2d4e9728363b919965296f5161"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.6-test4/PressTalk-0.1.6-test4-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://github.com/subtract0/presstalk-releases"

  depends_on macos: ">= :sonoma"

  app "PressTalk.app"

  postflight do |c|
    c.system_command "/bin/bash",
                     args: ["#{appdir}/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh"],
                     must_succeed: false
  end

  caveats <<~EOS
    PressTalk defaults to the native Fn / Globe push-to-talk trigger.
    After install, approve the macOS permission prompts from PressTalk.
    If you need to rerun setup manually, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-bootstrap.sh
    If you choose the optional F5 trigger and need the Karabiner bridge, use:
      /bin/bash /Applications/PressTalk.app/Contents/Resources/presstalk-karabiner-fallback.sh --enable
  EOS
end
