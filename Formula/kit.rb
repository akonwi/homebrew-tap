class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.45.0/kit_v0.45.0_darwin_arm64.tar.gz"
      sha256 "498cf96ad053bdf77e09e9660b0f0212144c9998429ee73822f59a20d7490c1b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.45.0/kit_v0.45.0_darwin_amd64.tar.gz"
      sha256 "21ed906e2cdec2ff91018d32468f2c541e5b92d11a5fe7306a7db402607dae2e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.45.0/kit_v0.45.0_linux_arm64.tar.gz"
      sha256 "562c5b079ec7a069b1c737fa43e6a8fb453d38cce04faf9060c9ca02c955ed42"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.45.0/kit_v0.45.0_linux_amd64.tar.gz"
      sha256 "dbd5fa8ad1ba8df43757a7822750a6cfa119df446b6e6a612ba9833892f5853c"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.45.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
