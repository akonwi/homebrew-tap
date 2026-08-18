class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.31.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.31.0/kit_v0.31.0_darwin_arm64.tar.gz"
      sha256 "5fc6aa8b46d9a6165960076ef4201060a4dc39ef8d446a7fe917880acd70b98e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.31.0/kit_v0.31.0_darwin_amd64.tar.gz"
      sha256 "160eee594c539c520cd7317be9aa218e167e5222b6c6e2a4d5b90a03224ecc00"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.31.0/kit_v0.31.0_linux_arm64.tar.gz"
      sha256 "d0ad7432628f8c14bc1c3b9b49e4dd96cf12e23ee33ff654f0999792a7d70b16"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.31.0/kit_v0.31.0_linux_amd64.tar.gz"
      sha256 "59951107a1f6c74c78d293f601ce1660fc2e2a5974575e12da86955dbf271b35"
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
    assert_match "v0.31.0", shell_output("#{bin}/kit version")
  end
end
