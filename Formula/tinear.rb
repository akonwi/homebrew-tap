class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.3.0/tinear-darwin-arm64.tar.gz"
      sha256 "e5ce9e567e48f0672da561ac3d4925c69e99ecd1ee415e12c4bf2e98edc9783c"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.3.0/tinear-darwin-amd64.tar.gz"
      sha256 "c5c3a613c6bbf4568ef7b054e8ebdd184716683da00fa2c084371927c3cf7f3e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.3.0/tinear-linux-arm64.tar.gz"
      sha256 "98535198706eb70db6c07e1383d23b031f714aa29d483fcf802571a7ae79f96e"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.3.0/tinear-linux-amd64.tar.gz"
      sha256 "cec55609b754303b930548425fe9ca194be585b410892057172d30a56eb5caa3"
    end
  end

  def install
    bin.install "tinear"
  end
end
