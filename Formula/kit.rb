class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.30.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.30.0/kit_v0.30.0_darwin_arm64.tar.gz"
      sha256 "aa8b8660105eedb456f6295547ef828613a49a41b4933b771631ea59e224705e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.30.0/kit_v0.30.0_darwin_amd64.tar.gz"
      sha256 "1556d4b0054796965f2083baf592e67baedcd83cea928891a4717f2c749eecab"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.30.0/kit_v0.30.0_linux_arm64.tar.gz"
      sha256 "84175399be6433f32b7aac289c75141960b5863fb09f05bda329b20462387df8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.30.0/kit_v0.30.0_linux_amd64.tar.gz"
      sha256 "120f0f87d9a0a00ebf5dec08b2571c993dc2e1860a778d9133052be07c2160a8"
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
    assert_match "v0.30.0", shell_output("#{bin}/kit version")
  end
end
