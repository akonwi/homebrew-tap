class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.21.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.21.1/kit_v0.21.1_darwin_arm64.tar.gz"
      sha256 "0951cc6bdac04b5c432ed0aadd708c4b72755036fc357d10d5b0f9fd06fd3db5"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.1/kit_v0.21.1_darwin_amd64.tar.gz"
      sha256 "323a76c9a88f59227564560f117324c70b004cc6fc93670cb3ed80808e02e492"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.21.1/kit_v0.21.1_linux_arm64.tar.gz"
      sha256 "2903fb84147f5035242ad00da2881e779f987593fa4c43a423ca7a48308775c7"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.1/kit_v0.21.1_linux_amd64.tar.gz"
      sha256 "e2a0d8fae654f0f73966d33bf9cb755e28e185ec3cad3dc0c9dbca7c79e0b1f1"
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
    assert_match "v0.21.1", shell_output("#{bin}/kit version")
  end
end
