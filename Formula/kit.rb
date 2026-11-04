class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.54.0/kit_v0.54.0_darwin_arm64.tar.gz"
      sha256 "3ab0c0a3715f7aa6df67846b52fef35b8d6d2ab7cc7f95fec3b426df6b91d049"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.54.0/kit_v0.54.0_darwin_amd64.tar.gz"
      sha256 "59674d38084a9f7ccf726adb86374129b8664999cd1d7902ce1c08ee34a662c4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.54.0/kit_v0.54.0_linux_arm64.tar.gz"
      sha256 "e8256635ddfc5fb634ea3826163c51e2573b1404c862168adb141a68eefbdc17"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.54.0/kit_v0.54.0_linux_amd64.tar.gz"
      sha256 "04bd34a6badc3f4a7ff5cefda715dd88ef9874a16626a5f6668766114d5fa79b"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.54.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
