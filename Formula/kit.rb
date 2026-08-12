class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.28.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.28.0/kit_v0.28.0_darwin_arm64.tar.gz"
      sha256 "e52b4d1444849a205eb1f50384b0478575ffef9ee271b354ebf5bccc5dccbc19"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.28.0/kit_v0.28.0_darwin_amd64.tar.gz"
      sha256 "b61fed0d4bcc4e66d4ccf74f317d0aedaf17b21ce3ef2417b44e260dee8258ba"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.28.0/kit_v0.28.0_linux_arm64.tar.gz"
      sha256 "c25f31fad905b3287cf88c99bcc6fae55f7ebb8025c5d7af271b7d2e883fc326"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.28.0/kit_v0.28.0_linux_amd64.tar.gz"
      sha256 "3b5506c02e686232eae79ec0d90a7900281d3aff64a0ffafc14303411cac0a80"
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
    assert_match "v0.28.0", shell_output("#{bin}/kit version")
  end
end
