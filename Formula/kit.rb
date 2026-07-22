class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.23.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.23.0/kit_v0.23.0_darwin_arm64.tar.gz"
      sha256 "f3f181bf8ebca869ecf31243e39f65e3bb7bf36ef2e0b2e3dd0054f256749835"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.23.0/kit_v0.23.0_darwin_amd64.tar.gz"
      sha256 "b1983ea516eb43d955b2083a578ca17f100af6eb775a1ef22856d12bac136a66"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.23.0/kit_v0.23.0_linux_arm64.tar.gz"
      sha256 "b31b724d853c265a44a663f3ac1796e1722f0666441d8b23df83ce6e4e5a24ac"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.23.0/kit_v0.23.0_linux_amd64.tar.gz"
      sha256 "3dd749ba5d3f47efcd616a161404e32c666f2340fcf4b74cc27c49cb0f43f0df"
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
    assert_match "v0.23.0", shell_output("#{bin}/kit version")
  end
end
