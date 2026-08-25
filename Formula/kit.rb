class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.33.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.33.1/kit_v0.33.1_darwin_arm64.tar.gz"
      sha256 "816bc5933dc4c67bb77d1e845c1b37acbcd4639189f580633ab7db870ccc729f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.33.1/kit_v0.33.1_darwin_amd64.tar.gz"
      sha256 "64740171b702afad59604534a751f032fe8cf8784bda50a6e3c17376a6db2ea1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.33.1/kit_v0.33.1_linux_arm64.tar.gz"
      sha256 "1b7404d1f0182eddca49af1bbae6b603206acbfc7d5bb249baa4e1a512ca21b1"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.33.1/kit_v0.33.1_linux_amd64.tar.gz"
      sha256 "8e442bc52e8ad842523ad08d8b97db56649cdcdc945e3fac5d6ecd8611002b6a"
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
    assert_match "v0.33.1", shell_output("#{bin}/kit version")
  end
end
