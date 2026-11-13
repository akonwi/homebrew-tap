class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.62.0/kit_v0.62.0_darwin_arm64.tar.gz"
      sha256 "25ba6346114cd462da0d7db7ca0fd6ce91dbd390323f4821b1c8a3f722f7e714"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.62.0/kit_v0.62.0_darwin_amd64.tar.gz"
      sha256 "d8d1568975a4254fb5ec3738d133d7791eac08cdf7861d0bec898cc4f7d214bc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.62.0/kit_v0.62.0_linux_arm64.tar.gz"
      sha256 "f6af7b0e9e48601e7a0ff56030a1e8f7c381bca1f7afc4a4c22ac71d64b29ac8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.62.0/kit_v0.62.0_linux_amd64.tar.gz"
      sha256 "f2be82b3b1770d85744fa119247d9232342bc6b6c4604cbcf58bb299e61681e2"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.62.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
