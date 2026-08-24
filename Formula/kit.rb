class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.33.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.33.0/kit_v0.33.0_darwin_arm64.tar.gz"
      sha256 "c32d8970dab65e78ad02364e8cc5812346eba052cb269557d32ad6b587c23b6d"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.33.0/kit_v0.33.0_darwin_amd64.tar.gz"
      sha256 "5dde98daae9e749ead54f3f0b86882acb020b0ae4d32817a4119fea2a804c0c5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.33.0/kit_v0.33.0_linux_arm64.tar.gz"
      sha256 "3dfa4f6a6e97d239f9ca7c2c5be15e3e8f70d59bdf31af144b5ccad02c6eaab6"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.33.0/kit_v0.33.0_linux_amd64.tar.gz"
      sha256 "f66ee84137c7280681b31408bf14d18d23e4d1224c6443045d5cfa579ab37de0"
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
    assert_match "v0.33.0", shell_output("#{bin}/kit version")
  end
end
