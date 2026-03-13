cask "presstalk" do
  version "0.1.2"
  sha256 "9f35255395d73a1767f802e918038bc2c1517955136514ab9b10550438ce1a77"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.2/PressTalk-0.1.2-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://github.com/subtract0/presstalk-releases"

  depends_on macos: ">= :sonoma"
  depends_on cask: "karabiner-elements"

  app "JarvisTap.app"

  postflight do |c|
    c.system_command "/bin/bash",
                     args: ["#{appdir}/JarvisTap.app/Contents/Resources/presstalk-bootstrap.sh"],
                     must_succeed: false
  end

  caveats <<~EOS
    PressTalk installs as JarvisTap.app to preserve macOS permission grants.
    The installer also pulls in Karabiner-Elements for the F5 / microphone-key bridge.
    After install, approve the macOS permission prompts from PressTalk and Karabiner-Elements.
  EOS
end
