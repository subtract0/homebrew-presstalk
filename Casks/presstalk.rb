cask "presstalk" do
  version "0.1.0"
  sha256 "0b50cb527df6c6ef0efe0da41734e032bc508162f5dfb087b04c83d2f628a56e"

  url "https://github.com/subtract0/presstalk-releases/releases/download/v0.1.0/PressTalk-0.1.0-macos-arm64.zip"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://github.com/subtract0/presstalk-releases"

  depends_on macos: ">= :sonoma"

  app "JarvisTap.app"

  caveats <<~EOS
    PressTalk installs as JarvisTap.app to preserve macOS permission grants.
    After first launch, grant Microphone, Input Monitoring, and Accessibility.
  EOS
end
