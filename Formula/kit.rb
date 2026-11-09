class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.57.0/kit_v0.57.0_darwin_arm64.tar.gz"
      sha256 "8d9c8d27245bf48c51c7e3fe92a3d6e10aeaf63c92620fb52a80e8e25c456637"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.57.0/kit_v0.57.0_darwin_amd64.tar.gz"
      sha256 "5ecb7fe0d0f5db3a64d6db2718ad3b8ce3eca8ec91f96a23fe7ea7c8ff64fe83"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.57.0/kit_v0.57.0_linux_arm64.tar.gz"
      sha256 "a1f2081f781f405ef7c0abb101ca9b809d443707bbc6149178015ae603ec154d"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.57.0/kit_v0.57.0_linux_amd64.tar.gz"
      sha256 "f263b3db9d1b972b7a595a24748bd253251aceaf1884f2f53a2ecabf131cade9"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.57.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
