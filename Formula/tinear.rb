class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.12.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.12.0/tinear-darwin-arm64.tar.gz"
      sha256 "88f4a03521f52f4f950f90237b805500d152d7377db336692da22699113ddb1a"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.12.0/tinear-darwin-amd64.tar.gz"
      sha256 "549534e17827ef60c047db7195b2efdf762ea23a31fad99a264f25f0ea64f925"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.12.0/tinear-linux-arm64.tar.gz"
      sha256 "1895776540906d8871e314dd4859bba7181e4dcf4314e0eadb7ee5814dc2287d"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.12.0/tinear-linux-amd64.tar.gz"
      sha256 "fd6b100f398f6cedd35291077c3ea3f5461036861f14733f2f95ab245cc4cae3"
    end
  end

  def install
    bin.install "tinear"
  end
end
