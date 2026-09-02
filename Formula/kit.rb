class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.34.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.34.0/kit_v0.34.0_darwin_arm64.tar.gz"
      sha256 "5ae9c97c721ade3c028df31e905b45c4d682feec4b1f189508e6f78dcca9e199"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.34.0/kit_v0.34.0_darwin_amd64.tar.gz"
      sha256 "26bfce934548f7b41a5cc783df4c52ee63545a871d20db0f788b7c1e7127bbb4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.34.0/kit_v0.34.0_linux_arm64.tar.gz"
      sha256 "b555f528a0e1e3c260aa46ab7a70c1e7e6125a60a178dd492c782e5e2b566ffd"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.34.0/kit_v0.34.0_linux_amd64.tar.gz"
      sha256 "fd90363cf8e1270464e200bc56bd708147f75c15532342bbc1353d4fcc3d5013"
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
    assert_match "v0.34.0", shell_output("#{bin}/kit version")
  end
end
