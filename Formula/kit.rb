class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.19.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.19.0/kit_v0.19.0_darwin_arm64.tar.gz"
      sha256 "3be69d46bbc32239bcf7104e0310fa2b98add490d55a78e2bc8e5c8d391f47eb"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.0/kit_v0.19.0_darwin_amd64.tar.gz"
      sha256 "db9b5a6c89afb66190fdcdff4fe47d4850abeee994fb283cdb1fa92d70248685"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.19.0/kit_v0.19.0_linux_arm64.tar.gz"
      sha256 "ca815c46b2298888a3dcd930475d78d71d5d08f236e189bdb1672aa9fb008fef"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.0/kit_v0.19.0_linux_amd64.tar.gz"
      sha256 "1b885c59c0018c014a9ffc698dc7e4d94ee3904e17365227d1fd3be4333fe794"
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
    assert_match "v0.19.0", shell_output("#{bin}/kit version")
  end
end
