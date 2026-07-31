class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.34.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.34.0/ard_v0.34.0_darwin_arm64.tar.gz"
      sha256 "b503dd9ead3d3ad8bd20432cd0cff753183e62588f9562071d3056a4123c065f"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.34.0/ard_v0.34.0_darwin_amd64.tar.gz"
      sha256 "1225c0f2caf935f4e8fa295d65296b0517c974494c3841388cd56f2c646b77c9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.34.0/ard_v0.34.0_linux_arm64.tar.gz"
      sha256 "cb484f2e6192f6231484b6be8847b2c0b2585b392bd89c3a9b1f208141172bd0"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.34.0/ard_v0.34.0_linux_amd64.tar.gz"
      sha256 "f3392452ecd796bd4a1dc4ac3900f130f0ff2eecc8c359633a0e5a590edb1fba"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.34.0", shell_output("#{bin}/ard version")
  end
end
