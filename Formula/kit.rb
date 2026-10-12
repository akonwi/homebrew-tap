class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.43.2/kit_v0.43.2_darwin_arm64.tar.gz"
      sha256 "bb306fb0308ae6da055afec43403eefca66c14f1e9ec76a6a56b7d89688991fc"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.2/kit_v0.43.2_darwin_amd64.tar.gz"
      sha256 "9ac783e5599997f7dd5331033acc2e4d392e69728deaa91c341d8dcf5d373a15"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.43.2/kit_v0.43.2_linux_arm64.tar.gz"
      sha256 "983c18d429939eb7b9d500c58e60f32bf65baafb173846e3c3013a99099b4da6"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.2/kit_v0.43.2_linux_amd64.tar.gz"
      sha256 "1571ce8a148bf183da3ec40ab8376a86136f49b6f67d95b02a101efc4501950f"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.43.2 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
