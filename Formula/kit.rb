class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.35.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.35.1/kit_v0.35.1_darwin_arm64.tar.gz"
      sha256 "2cc2cfe7799aab8a47cee231e81c52fab7b812cb4b9774aca7d6fee60cadd0a4"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.35.1/kit_v0.35.1_darwin_amd64.tar.gz"
      sha256 "117282f2465231b93564033fbe5ed5beeeacaf0740b2bae78e14c3cc627ed996"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.35.1/kit_v0.35.1_linux_arm64.tar.gz"
      sha256 "9349a96c7f0c78439b24609b21af0552ee6ce9ebef5818b1fe46ada6d1bd1047"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.35.1/kit_v0.35.1_linux_amd64.tar.gz"
      sha256 "e927fe858a3ed51d4df852eb66eddca5dcb1a42108cf4f7a4cc027c0f6018368"
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
    assert_match "v0.35.1", shell_output("#{bin}/kit version")
  end
end
