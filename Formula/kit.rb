class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.29.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.29.0/kit_v0.29.0_darwin_arm64.tar.gz"
      sha256 "7db13df5e93b7bf9aec41bff3bec962631cc72d9a9001c61c4d38ad97a76ad1e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.29.0/kit_v0.29.0_darwin_amd64.tar.gz"
      sha256 "9d6dd28e23a2720f222fa4bf0f79eaaee38775b5ade2c919cdb4ad47c371c5dd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.29.0/kit_v0.29.0_linux_arm64.tar.gz"
      sha256 "41323f417728fcaf68952739903ae7a710904c5773005d4bb7b3017a4a27c2d0"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.29.0/kit_v0.29.0_linux_amd64.tar.gz"
      sha256 "dff6f59fc31b944789ae128db4fbdc76b913680aabe56e5dfe2f1c28330118d8"
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
    assert_match "v0.29.0", shell_output("#{bin}/kit version")
  end
end
