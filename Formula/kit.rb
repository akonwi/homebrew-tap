class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.27.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.27.1/kit_v0.27.1_darwin_arm64.tar.gz"
      sha256 "6820a6ac708ba8f066d7b55a4252a853f1c8ca20760d0d7334acde99f2e3cf0d"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.27.1/kit_v0.27.1_darwin_amd64.tar.gz"
      sha256 "e2b812348f7648b3c6b63c83053cec98da350aba7272315af6bf6e4d1ec09a0e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.27.1/kit_v0.27.1_linux_arm64.tar.gz"
      sha256 "f14e88455c4818e38f1c7354e2da375b500d619c3aa27f6059ddc7d9de3a75e8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.27.1/kit_v0.27.1_linux_amd64.tar.gz"
      sha256 "1418a9f782d15a635890bc50e89a9fce4b1c9fa536b6de8c5b480faf8fa7141d"
    end
  end

  def install
    # The binary locates its runtime assets (tree-sitter worker,
    # grammars) relative to the resolved executable path, so install
    # both under libexec and symlink the binary into bin.
    libexec.install "kit", "runtime"
    bin.install_symlink libexec/"kit"
  end

  test do
    assert_match "v0.27.1", shell_output("#{bin}/kit version")
  end
end
