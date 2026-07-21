class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.22.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.22.0/kit_v0.22.0_darwin_arm64.tar.gz"
      sha256 "305562b8b540af866e00ee73eb913040263f47fcf4ec757a52cba59c2f4ef528"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.22.0/kit_v0.22.0_darwin_amd64.tar.gz"
      sha256 "99393196be3d8f6d61a0639e2b7680dad3b5975f47e8c05b579a4c64d80ed146"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.22.0/kit_v0.22.0_linux_arm64.tar.gz"
      sha256 "fea519dced15b5b890da04c4e1dd541ec8b779b96de2b67da56cc88ec649df81"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.22.0/kit_v0.22.0_linux_amd64.tar.gz"
      sha256 "f595671e5367c58b81023c883798446626ff79067e3fdc7e4c7d9cb69a751e98"
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
    assert_match "v0.22.0", shell_output("#{bin}/kit version")
  end
end
