cask "presstalk" do
  version "0.1.24"
  sha256 "f88c6618ffd69d4cfb9e354953a3757b1cb71bab3a71953e699cee6f1bea79e4"

  url "https://github.com/subtract0/presstalk/releases/download/v#{version}/PressTalk-#{version}-macos-arm64.dmg"
  name "PressTalk"
  desc "Hold-to-talk local dictation for Apple Silicon"
  homepage "https://presstalk.app/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "PressTalk.app"

  caveats <<~EOS
    Open PressTalk to complete setup: microphone permission, pasting into apps,
    a shortcut of your choice, and an approximately 460 MB speech-model download.
    Choose F5 or another supported shortcut if your keyboard's Fn key is not detected.
    The first recording after connecting AirPods can require a retry.
    Setup and troubleshooting: https://presstalk.app/download.html
  EOS
end
