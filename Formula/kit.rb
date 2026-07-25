class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.24.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.24.0/kit_v0.24.0_darwin_arm64.tar.gz"
      sha256 "c2c446f0cfadc3d620b26cbd2113e9f050ed75ff880fd1796f57bad51755aed3"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.24.0/kit_v0.24.0_darwin_amd64.tar.gz"
      sha256 "e40236e3621df59abfd4898c3e8858f533314efa459aeb3cac9094e6747158d6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.24.0/kit_v0.24.0_linux_arm64.tar.gz"
      sha256 "6c815dcb1248ca2f8390d8840d670333409cecd55702ddbd3ffd29a63e3cb2eb"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.24.0/kit_v0.24.0_linux_amd64.tar.gz"
      sha256 "94078b60154b52cc198e85ef3e935872e86dccb24814d34ef2df206a8a5a09b7"
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
    assert_match "v0.24.0", shell_output("#{bin}/kit version")
  end
end
