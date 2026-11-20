class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.48.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.48.1/ard_v0.48.1_darwin_arm64.tar.gz"
      sha256 "6f5baefd65f157ce09d935204c62598e935ed366b8798ae16a9546cc08b7d9c8"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.48.1/ard_v0.48.1_darwin_amd64.tar.gz"
      sha256 "b84691a8322b4b62562fa52eb24b84c05291269b702eff4afe4d0a48d79f9c2a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.48.1/ard_v0.48.1_linux_arm64.tar.gz"
      sha256 "a9603df878a8be883f7685ab0b411a3fa6eab434a56c9f51bbb8147c5ccb111d"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.48.1/ard_v0.48.1_linux_amd64.tar.gz"
      sha256 "f02f89177c5a0a58beda837122d2201aac930fad8fe04ffda7abefe02ba1a83e"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.48.1", shell_output("#{bin}/ard version")
  end
end
