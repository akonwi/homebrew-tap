class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.8.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.8.0/tinear-darwin-arm64.tar.gz"
      sha256 "648939f7c4a73e3cab45714b4abbf317158832567528f7a634d3d5a1c29af090"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.8.0/tinear-darwin-amd64.tar.gz"
      sha256 "30dddfb4fce6168ed9efbe4950b6139aaba4e317f6d303e772d9293d441a0f00"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.8.0/tinear-linux-arm64.tar.gz"
      sha256 "7b1d0780f42e45270cf9838546c8bb4bd9267fdf36e55c897e9c058a9758a4d7"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.8.0/tinear-linux-amd64.tar.gz"
      sha256 "bc4f99cdf76dc7ad8eaae4f0d5a6f7a03c67656788259f2ed4098e4a0acfc000"
    end
  end

  def install
    bin.install "tinear"
  end
end
