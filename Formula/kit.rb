class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.20.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.20.0/kit_v0.20.0_darwin_arm64.tar.gz"
      sha256 "517f49685e643823d279458a9f2b1579b57f6259d0a605b7991028c548e7de4e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.20.0/kit_v0.20.0_darwin_amd64.tar.gz"
      sha256 "a2f27c95e170f98ebaf267cc21dfeda80866d90afbb02722d805d5035976a5a4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.20.0/kit_v0.20.0_linux_arm64.tar.gz"
      sha256 "9e3938e9392dcd4ac2950418c387a1f6bfe1087d99b8f3155307a27dd456da1a"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.20.0/kit_v0.20.0_linux_amd64.tar.gz"
      sha256 "d32a0efd2d30772d2a80aa78684a54955cee65c4a85ff999d6ae7dbbe79bf99a"
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
    assert_match "v0.20.0", shell_output("#{bin}/kit version")
  end
end
