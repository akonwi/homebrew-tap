class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.10.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.10.1/tinear-darwin-arm64.tar.gz"
      sha256 "3ce98095d2d3443350aaae85141a1c65287817a4dee3f41d53ed00c72620fda9"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.10.1/tinear-darwin-amd64.tar.gz"
      sha256 "e3744faa18a68a6423fb5b692f0baa4bad7b2f1e1b4783c6f39dd874fe485183"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.10.1/tinear-linux-arm64.tar.gz"
      sha256 "de983ce7de57ffe2b16a5f156f1ad884449d72fb7cff5f16dc807050565a6d15"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.10.1/tinear-linux-amd64.tar.gz"
      sha256 "8b555a77c40582a2a6a245f4429ffc25517b48a5e5ca02a3c66784d372bfc9de"
    end
  end

  def install
    bin.install "tinear"
  end
end
