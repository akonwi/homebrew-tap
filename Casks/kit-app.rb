cask "kit-app" do
  version "0.19.1"
  sha256 "bf41ab8536f83ae7aa95cb487a02afd4a2f4d56080e631100429b88f1e259867"

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
