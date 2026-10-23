class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.49.1/kit_v0.49.1_darwin_arm64.tar.gz"
      sha256 "ed4b7d7702fea7eeb680f7c1cba2e980d613e1dcab3c41bb3bab9b9a92dada56"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.49.1/kit_v0.49.1_darwin_amd64.tar.gz"
      sha256 "aad5a4090f13abe2aea7b36297270be8d78d4fc25ed5c8d31a2123633aa432b3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.49.1/kit_v0.49.1_linux_arm64.tar.gz"
      sha256 "92f988a2229d7402293c304eefc529ee863dfb79fec61d16c3c625221c3ec04d"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.49.1/kit_v0.49.1_linux_amd64.tar.gz"
      sha256 "200c651aab9935de91559fdbce3a84f0adb0bdba0d5975cd63c4900a38b2ea81"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.49.1 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
