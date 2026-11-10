cask "kit-app" do
  version "0.16.0"
  sha256 "055a3f2655c9c50948c44816a97e0a412131e8167938efbc7369320d6ba0877e"

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
