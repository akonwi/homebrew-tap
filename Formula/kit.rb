class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.19.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.19.2/kit_v0.19.2_darwin_arm64.tar.gz"
      sha256 "3db98f71bc328f175f695d4d5aa2d30113e373d539484a888cc8dca487031a84"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.2/kit_v0.19.2_darwin_amd64.tar.gz"
      sha256 "6fe6261f1e37fa6f5dfdd3c5aefbeeeb4f71c7ffc67496ea6451bc5a77e94ac2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.19.2/kit_v0.19.2_linux_arm64.tar.gz"
      sha256 "14b1dae8065def5e1b3b9aff42621612d563ecca61709a20e59ff56d51015f9e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.19.2/kit_v0.19.2_linux_amd64.tar.gz"
      sha256 "281a801647316527926689c59b34737fffe912ad652fb890cdda451ca754cb76"
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
    assert_match "v0.19.2", shell_output("#{bin}/kit version")
  end
end
