class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.6.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.6.1/tinear-darwin-arm64.tar.gz"
      sha256 "4ccad586fe6c41ca56c92ebac10bf86985062b3c5d1ad52a870b16f6e0a47608"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.6.1/tinear-darwin-amd64.tar.gz"
      sha256 "967cac01b85d4adfd7e0aec6a5608c14f8d3fd958c0ace2710e4304992dc99a9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.6.1/tinear-linux-arm64.tar.gz"
      sha256 "5421f16e140a519ec72903ab8ba20f6ea2ab72a37f25e2591d6aba56642ab552"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.6.1/tinear-linux-amd64.tar.gz"
      sha256 "c9f8cd72a2dbad4398a6de191d58899f7bf4503c2374f8af77ca201d126d98e4"
    end
  end

  def install
    bin.install "tinear"
  end
end
