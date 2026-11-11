class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.47.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.47.0/ard_v0.47.0_darwin_arm64.tar.gz"
      sha256 "81020e1f3f6f9ee6956204a466aa118cfc675a6b876fc38d8da3bc311743d0ba"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.47.0/ard_v0.47.0_darwin_amd64.tar.gz"
      sha256 "73fef5eb1115d5c3fe9a144e4bcebe9f6a27547f78a332b63120fe88c1f021cd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.47.0/ard_v0.47.0_linux_arm64.tar.gz"
      sha256 "f55d35c3a11b0542ad6d6515d50b417f3251952a483b2c374052ccbf45cfda02"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.47.0/ard_v0.47.0_linux_amd64.tar.gz"
      sha256 "a21e668877e3e9dd2890e77995fb7294e5448a37bb2d763121e5bf39c57327a3"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.47.0", shell_output("#{bin}/ard version")
  end
end
