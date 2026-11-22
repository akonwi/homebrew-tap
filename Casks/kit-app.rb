cask "kit-app" do
  version "0.21.0"
  sha256 "0b5b0292ca4006badd5e03c4c88a66a82a93cad6de7426769c6dd8dbce708167"

  url "https://github.com/akonwi/kit/releases/download/macos-v#{version}/kit_macos-v#{version}_darwin_arm64.zip"
  name "Kit"
  desc "Native desktop client for the Kit coding agent"
  homepage "https://github.com/akonwi/kit"

  livecheck do
    url :url
    regex(/^macos-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Kit.app"

  caveats <<~EOS
    Kit.app needs a separately installed, running, protocol-compatible Kit server.
    The app does not install, start, or replace a server. The CLI is available
    separately with `brew install akonwi/tap/kit`.
  EOS
end
