class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.38.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.38.0/ard_v0.38.0_darwin_arm64.tar.gz"
      sha256 "cc0844ed0d8e8340a6a46e36b1cdf5e909791398a4c9b8026a5d6fffce47368f"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.38.0/ard_v0.38.0_darwin_amd64.tar.gz"
      sha256 "8aeb9870005296ff082276d9f5c1ca0a6ae2c142cf04182f9c2d91722115353f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.38.0/ard_v0.38.0_linux_arm64.tar.gz"
      sha256 "e4ae7b58091cc85893b7370b56c090c5067cd56f8775dfe7addbcd09198860e2"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.38.0/ard_v0.38.0_linux_amd64.tar.gz"
      sha256 "dffac374ace04d46a31479480c028da9ad5952fbff5c347a8228a434851e923a"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.38.0", shell_output("#{bin}/ard version")
  end
end
