cask "presstalk" do
  version "0.1.28"
  sha256 "47ffee59d2c82ecedd6227b077f43eba5a95e5a0cd258361b98e509822b531cf"

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
