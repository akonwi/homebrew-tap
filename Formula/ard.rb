class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.44.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.44.0/ard_v0.44.0_darwin_arm64.tar.gz"
      sha256 "6cf55dc1bf9e71323f79f813bc884d088d2da015a559232e50c7d0c84ead0312"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.44.0/ard_v0.44.0_darwin_amd64.tar.gz"
      sha256 "238c4216468fd2c15042734c88f11f9924efa773de0ff1452cae6dbf03a8cca3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.44.0/ard_v0.44.0_linux_arm64.tar.gz"
      sha256 "0ab3dae9bd9242bcb96c27bc9b1de3c5fc1bb8e6974842ae2f843c892e2375bb"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.44.0/ard_v0.44.0_linux_amd64.tar.gz"
      sha256 "c730458ab3b4bedfad7d72c3ef79b105f8127c2fdad14340bcbeef809c52e9c6"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.44.0", shell_output("#{bin}/ard version")
  end
end
