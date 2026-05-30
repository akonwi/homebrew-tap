class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-darwin-arm64.tar.gz"
      sha256 "48760932dad21e409e9b48c1ba4dfc15ab4f84f310b113c0b24ae2d30018c8e1"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-darwin-amd64.tar.gz"
      sha256 "6819a5dd2453ce93c1bbc4d79b731e1d3cf14776f4caccf491f9131bd04ebc4b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-linux-arm64.tar.gz"
      sha256 "b194a3b01a398548c2cf1b58412715283514fd749f09e13cc51a0a94a027bb00"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-linux-amd64.tar.gz"
      sha256 "a090a3697aad6cc64b573a4244a8c393fe9929bbf5ee2f993a357e403653cecc"
    end
  end

  def install
    bin.install "tinear"
  end
end
