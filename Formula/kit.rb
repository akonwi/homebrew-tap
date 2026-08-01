class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.25.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.25.0/kit_v0.25.0_darwin_arm64.tar.gz"
      sha256 "8b6c7aa0caecf1cc078523b3326e241a7dd3ea1bc16d9988de5fe725dd6af872"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.25.0/kit_v0.25.0_darwin_amd64.tar.gz"
      sha256 "43dcd96b607d18a3343b57b3dde6f4c0ccace0fea3ed90f3d39ee24d4d1f2b93"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.25.0/kit_v0.25.0_linux_arm64.tar.gz"
      sha256 "6bdcf6eea73377538f630b8a49495fcbaccd480f41b2a00966c247916bf95f05"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.25.0/kit_v0.25.0_linux_amd64.tar.gz"
      sha256 "c749756ce59c2797a7546899dc4b0f9d0dc7a6941cc4f43b30dd6a0f624421b6"
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
    assert_match "v0.25.0", shell_output("#{bin}/kit version")
  end
end
