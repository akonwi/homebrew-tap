class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.32.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.32.0/kit_v0.32.0_darwin_arm64.tar.gz"
      sha256 "7ea1722adfa221095a55d595cadbb97ea5670a0b7104944cd73e65ce2d8a571b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.32.0/kit_v0.32.0_darwin_amd64.tar.gz"
      sha256 "d16c9cb360b41c3ab480c7aa4b6f9874b8e38911864c8996a09726d951373ed9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.32.0/kit_v0.32.0_linux_arm64.tar.gz"
      sha256 "07aaf86cad8b555758e4dfbc4e71012592924189144791b80618f1f688d5a73d"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.32.0/kit_v0.32.0_linux_amd64.tar.gz"
      sha256 "519508a747a950cd9daf480a09c61e2e417e6c4ecb374a93fc21e49bfbb1c198"
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
    assert_match "v0.32.0", shell_output("#{bin}/kit version")
  end
end
