class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.19.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.19.1/kit_v0.19.1_darwin_arm64.tar.gz"
      sha256 "ee745c4d15753bbe4ba584e5335df9b0c3a77ac1364bd907fac48741126743a3"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.1/kit_v0.19.1_darwin_amd64.tar.gz"
      sha256 "fa7644eb87b06d048dfe7fdaa42bd1d3f986bbe508b62196cda694ab4cafa156"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.19.1/kit_v0.19.1_linux_arm64.tar.gz"
      sha256 "314389a37a17b527f39f35d49f2a8334952fc41aa4eaeaf36d2951069400b7de"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.1/kit_v0.19.1_linux_amd64.tar.gz"
      sha256 "ef64d09886d8bd20571d71fc023fa72afe4d427c1186f269ed01db26cca51be5"
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
    assert_match "v0.19.1", shell_output("#{bin}/kit version")
  end
end
