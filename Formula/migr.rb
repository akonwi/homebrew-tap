class Migr < Formula
  desc "Database migration tool"
  homepage "https://github.com/akonwi/migr"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/migr/releases/download/v0.1.0/migr-darwin-arm64.tar.gz"
      sha256 "7239a3191a2d1476c02099aa44b820ea3dac143661fd670d174a4a3dc7d0c6bd"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.0/migr-darwin-amd64.tar.gz"
      sha256 "48643b95a1c1d487bd190b09431cf834c149b47c1587f37d6fe8adcef6ee5718"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/migr/releases/download/v0.1.0/migr-linux-arm64.tar.gz"
      sha256 "9ddcc377b55ff5a08a0462a91416b1425d9a887880ec78fc26322aa7cb9b0036"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.0/migr-linux-amd64.tar.gz"
      sha256 "69b1dd03e4abb1435fd39c4da431749716283579ef9e3226f714b5482a18e015"
    end
  end

  def install
    bin.install "migr"
  end
end
