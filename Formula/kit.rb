class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.35.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.35.0/kit_v0.35.0_darwin_arm64.tar.gz"
      sha256 "bc5a0eb2afade990347da926b54c54b4fc075bc97857aa391afa7515b8772467"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.35.0/kit_v0.35.0_darwin_amd64.tar.gz"
      sha256 "2224d5c751026ef81f651bfa94e5b1a415f398799ba48184d401513cb8e2ffec"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.35.0/kit_v0.35.0_linux_arm64.tar.gz"
      sha256 "65e4c8f038a8cfe79d2da2460ec3bbc84e8999ffa0e191e1f28eb4d6fa33ba0f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.35.0/kit_v0.35.0_linux_amd64.tar.gz"
      sha256 "37de4cf2c48e1a925b25071305688250f7b9a70306043e244ee6d8feb16f600c"
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
    assert_match "v0.35.0", shell_output("#{bin}/kit version")
  end
end
