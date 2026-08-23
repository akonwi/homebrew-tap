class Kb < Formula
  desc "Fast, private, local knowledge base for Markdown"
  homepage "https://github.com/akonwi/kb"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.1.0/kb-darwin-arm64.tar.gz"
      sha256 "c965a584fdcf74cc7d306d1be70b54b54a848e2aae80f12996c99dab2df367cd"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.1.0/kb-darwin-amd64.tar.gz"
      sha256 "a3bf9627cca58621998f2b05bb714f5854f67bd929dc750a80ac3897d69ef34c"
    else
      odie "kb supports only arm64 and x86_64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.1.0/kb-linux-arm64.tar.gz"
      sha256 "657bd6e82450d07cb312c0c63cbaf454b9384b5308dc4b2e80b51944c60fa74f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kb/releases/download/v0.1.0/kb-linux-amd64.tar.gz"
      sha256 "84d3c34953a78e8b0bd09eb07f1b8a056cb9578bc44ac6a6375b65b8ef5fa5a5"
    else
      odie "kb supports only arm64 and x86_64"
    end
  end

  def install
    bin.install "kb"
  end

  test do
    assert_equal "kb v0.1.0", shell_output("#{bin}/kb version").strip
  end
end
