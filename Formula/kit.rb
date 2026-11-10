class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.58.0/kit_v0.58.0_darwin_arm64.tar.gz"
      sha256 "a88f4a0b62bb4330239c6af819d09373b4d0ac455b677da55664d828f154d1e4"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.58.0/kit_v0.58.0_darwin_amd64.tar.gz"
      sha256 "28b00109716ead3e93d82fc7a6b94d97fddfaa985a446b87bf9663a88150be05"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.58.0/kit_v0.58.0_linux_arm64.tar.gz"
      sha256 "6e81c0b09ccb668b0f380dd855743a98bbb73ea007c9966ba08d379768d914f8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.58.0/kit_v0.58.0_linux_amd64.tar.gz"
      sha256 "907437897a09dbb3dba71b3eef080ac11ecb38ec06e1d5bf9eae719e54f5bd87"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.58.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
