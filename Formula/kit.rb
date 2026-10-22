class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.49.0/kit_v0.49.0_darwin_arm64.tar.gz"
      sha256 "fcaa5bbcfbb816f20d42fd8121c72af65917147b1adc6376336810ded38cd2fc"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.49.0/kit_v0.49.0_darwin_amd64.tar.gz"
      sha256 "e3ced3df6d365f23e1f018da9a90bf03a4a843000770ca5a1e2488a5c8336b0d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.49.0/kit_v0.49.0_linux_arm64.tar.gz"
      sha256 "441a45688f33a95b1c5194d5d8f9dcba610bc5e0f03e303f6a222d5e55ce3b41"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.49.0/kit_v0.49.0_linux_amd64.tar.gz"
      sha256 "82d59e8bf97e35a954b116532e425b6dbdf944708fdfed9b4fdcff8d2b0bdd0d"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.49.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
