class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.26.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.26.0/kit_v0.26.0_darwin_arm64.tar.gz"
      sha256 "47c613e7352af03a529af33519a4819d83462db73d6bd461c4f69c873208ae7f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.26.0/kit_v0.26.0_darwin_amd64.tar.gz"
      sha256 "e923b0b8de3cff3548795327ce01d22fd752bb3a6eb4bf2551e53de2bde23603"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.26.0/kit_v0.26.0_linux_arm64.tar.gz"
      sha256 "0ab34396f9159bc449ca5d582a5c3a709f93d8d22be822c92c2159dd00546ff8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.26.0/kit_v0.26.0_linux_amd64.tar.gz"
      sha256 "6dbad3b755fadd4492b5a8263121035c3546d682cdcd2706eef406a5c8f26726"
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
    assert_match "v0.26.0", shell_output("#{bin}/kit version")
  end
end
