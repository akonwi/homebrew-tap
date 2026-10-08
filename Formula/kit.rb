class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.41.0/kit_v0.41.0_darwin_arm64.tar.gz"
      sha256 "337a36e08bd72bd01b3bac7a74446da18a9eaedeb441c9b3b189a5bf4771d201"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.41.0/kit_v0.41.0_darwin_amd64.tar.gz"
      sha256 "ce09a1ae35aa665287ebf8896a591aea63296ac27bcfabe4341362fcff56c9ad"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.41.0/kit_v0.41.0_linux_arm64.tar.gz"
      sha256 "3e937c8cd93459d7308c5d8df6e0b24cdb83c37a8d6e5998f56971a85aab113a"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.41.0/kit_v0.41.0_linux_amd64.tar.gz"
      sha256 "e1848de2b4cf7fedb77e419351fbe91b99efec6988f4863e9c7bdcdbdbb15101"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.41.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
