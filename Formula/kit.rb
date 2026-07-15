class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.21.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.21.0/kit_v0.21.0_darwin_arm64.tar.gz"
      sha256 "0372bae6bea64e492dd3ce0ca9d32497d9139cfd831a23d577d96958ff00b33c"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.0/kit_v0.21.0_darwin_amd64.tar.gz"
      sha256 "5b193f7af4d68dac85edc62daaea98ee7aaba7807aa5d45ac79a33ee4e7210ed"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.21.0/kit_v0.21.0_linux_arm64.tar.gz"
      sha256 "6ecb9e9de67242b628bc7ffa07172274051a83d2ccc39fc28a8fae8c2c9782aa"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.0/kit_v0.21.0_linux_amd64.tar.gz"
      sha256 "8f82aee5a2c74bf70e7b0a5fcf1a4fe461031c271119dddb42b26b1bdd8d6877"
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
    assert_match "v0.21.0", shell_output("#{bin}/kit version")
  end
end
