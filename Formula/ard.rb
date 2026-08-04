class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.35.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.35.0/ard_v0.35.0_darwin_arm64.tar.gz"
      sha256 "f57425773ee8a73f5bba9e703917c8912f6927c9ec713451a7373bce812855f0"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.35.0/ard_v0.35.0_darwin_amd64.tar.gz"
      sha256 "546806a3bd0416b3aefdefb7169eeddfe8fce42554260cb60001b74674999638"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.35.0/ard_v0.35.0_linux_arm64.tar.gz"
      sha256 "a38db7b76b288bfaae5b6dc231c787f25769bfd6a738fd2d8ea4fa132f28dcfc"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.35.0/ard_v0.35.0_linux_amd64.tar.gz"
      sha256 "7b1d7e7f6a42d030149375c48c219f33607976c2be507d2586c56e3a2bec915c"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.35.0", shell_output("#{bin}/ard version")
  end
end
