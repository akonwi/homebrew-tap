class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.61.0/kit_v0.61.0_darwin_arm64.tar.gz"
      sha256 "4c085eb26e61a136caa100e2265833e46ed6a2335816a4dddfcd24fd6e2fccf4"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.61.0/kit_v0.61.0_darwin_amd64.tar.gz"
      sha256 "5e52810ab82c0e2c3de8761c74f5f1add2a12f72edc6423ce25422a1e326664c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.61.0/kit_v0.61.0_linux_arm64.tar.gz"
      sha256 "d58598693c59c2d868d79ed449aa2e02fb9aa81e3f28241791da7d56700829f6"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.61.0/kit_v0.61.0_linux_amd64.tar.gz"
      sha256 "a23bb7d764cf468220268a5c5bb6322f16215a2a39fa55b034d475b73fbb3bd0"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.61.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
