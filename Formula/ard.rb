class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.41.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.41.0/ard_v0.41.0_darwin_arm64.tar.gz"
      sha256 "278fbdc6d92bf06ac671ad46c9d14770e491aae2824f41b2d98b542da0f192a2"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.41.0/ard_v0.41.0_darwin_amd64.tar.gz"
      sha256 "a16ae2e2404c6d6036692d8f76e28cdb86dda874be8415868b0091a17dc941fc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.41.0/ard_v0.41.0_linux_arm64.tar.gz"
      sha256 "42343cff547aa615e9012f631475fe821088176f7ac6278a8eac48234b6a9f68"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.41.0/ard_v0.41.0_linux_amd64.tar.gz"
      sha256 "171b1281ae46197e0f6ca5e21ba77ff7ba024282d4bdcdb26e6fd740d9ed5c01"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.41.0", shell_output("#{bin}/ard version")
  end
end
