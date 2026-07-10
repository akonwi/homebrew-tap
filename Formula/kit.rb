class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.19.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.19.3/kit_v0.19.3_darwin_arm64.tar.gz"
      sha256 "3e8f42b59d246284e325b68432e37fe1f9b967ad00ca659eb21f55e0794f1652"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.3/kit_v0.19.3_darwin_amd64.tar.gz"
      sha256 "29f0768d806323d02b105a876da8e894757a3c2ecc2528ad2ec0dd89e2383884"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.19.3/kit_v0.19.3_linux_arm64.tar.gz"
      sha256 "e6a9f3440971b9a254b04fdd6e5fd0098bf552edce7cb54190f6a8d84bc32bb8"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.3/kit_v0.19.3_linux_amd64.tar.gz"
      sha256 "4cd3bfbd8d6a22b40b9d64a7b756d58c15336ef91285b24dbd935ec2359f0727"
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
    assert_match "v0.19.3", shell_output("#{bin}/kit version")
  end
end
