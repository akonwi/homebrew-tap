class Kb < Formula
  desc "Fast, private, local knowledge base for Markdown"
  homepage "https://github.com/akonwi/kb"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.2.0/kb-darwin-arm64.tar.gz"
      sha256 "68dbbeee39bda4ee2e0c0cb688089442e873d5e4042888572accbf67c0d3e846"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.2.0/kb-darwin-amd64.tar.gz"
      sha256 "882101be780a515efe9b3288a598541b15be486fad4828e6e58d6d08b18b2e35"
    else
      odie "kb supports only arm64 and x86_64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.2.0/kb-linux-arm64.tar.gz"
      sha256 "002008fead5ed0209c81795c646e27bace6a9f3176db0e36f0468ca16964f2ae"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.2.0/kb-linux-amd64.tar.gz"
      sha256 "3b6e8bc1e8765cf2d66d117d3bf2b0ce7e1738202d46887f979c3158298cfb2a"
    else
      odie "kb supports only arm64 and x86_64"
    end
  end

  def install
    bin.install "kb"
  end

  test do
    assert_equal "kb v0.2.0", shell_output("#{bin}/kb version").strip
  end
end
