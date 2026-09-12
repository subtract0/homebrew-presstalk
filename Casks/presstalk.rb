cask "presstalk" do
  version "0.1.25"
  sha256 "95c56585deb63effa40492b01a6729de8cd5425fedb52b28abb4374296058d3a"

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
