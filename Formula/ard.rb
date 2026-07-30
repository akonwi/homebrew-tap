class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.33.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.33.0/ard_v0.33.0_darwin_arm64.tar.gz"
      sha256 "74152a34aff656351aca5453b4d6ef3b800cb5775ba7be163df99fea93c52873"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.33.0/ard_v0.33.0_darwin_amd64.tar.gz"
      sha256 "0c91129c99bcbf6624b0f3aa4041ac57c07990743563fbd0be7663453f60aff4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.33.0/ard_v0.33.0_linux_arm64.tar.gz"
      sha256 "3ece02c0197b922c11fa87bfa26d752c0f4ef2fbdd5a2156589346f1bf9776ea"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.33.0/ard_v0.33.0_linux_amd64.tar.gz"
      sha256 "224fa117856544bf7a0e203012907f389fa6aff77f0a97c07a8377d7772106a0"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.33.0", shell_output("#{bin}/ard version")
  end
end
