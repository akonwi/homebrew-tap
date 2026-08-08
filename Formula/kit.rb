class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.27.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.27.0/kit_v0.27.0_darwin_arm64.tar.gz"
      sha256 "dde04d267e0a07d87b1bc7dcd1dabaf9b78a9a21030843507fa006851f14a304"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.27.0/kit_v0.27.0_darwin_amd64.tar.gz"
      sha256 "510b41e267d6b0b15a48cc1e4e9e387ccb5c2b45343eff97c9eaca6d00faa2ba"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.27.0/kit_v0.27.0_linux_arm64.tar.gz"
      sha256 "0b13d18d454adfa5c687c8c429cab8dfec68f3544dd46b38d371fdd3d599d6e7"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.27.0/kit_v0.27.0_linux_amd64.tar.gz"
      sha256 "284c208dab87949877c5449c951c328abae767131b10bb497fbd1689a19e2cea"
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
    assert_match "v0.27.0", shell_output("#{bin}/kit version")
  end
end
