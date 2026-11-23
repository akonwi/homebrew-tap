class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.67.0/kit_v0.67.0_darwin_arm64.tar.gz"
      sha256 "f4b4f5212fd33ad6b96b4be12d166a57f6e218c561248dfea4c6886928ccd30b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.67.0/kit_v0.67.0_darwin_amd64.tar.gz"
      sha256 "28f0464b48f46aabd362e3014b985ba2dca8a29c22713fae34882a864ce64d13"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.67.0/kit_v0.67.0_linux_arm64.tar.gz"
      sha256 "69cd6e4d28c69e68cc50f3e07dbc4042a4e405bf6f5a278fde68ecea4d5202ec"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.67.0/kit_v0.67.0_linux_amd64.tar.gz"
      sha256 "373c05368e296e8cee61bdb561f969f629f046e876cbbb63f5e39e3cc68e6845"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.67.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
