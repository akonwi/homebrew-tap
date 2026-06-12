class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.2.0/tinear-darwin-arm64.tar.gz"
      sha256 "127042e8211bf43d61484ee25764a3b85206c7a59af6459f594021593bcc09f5"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.2.0/tinear-darwin-amd64.tar.gz"
      sha256 "bd1f7c14da921d15ec52b9d04cb24483154321fe1a361fc4832ea928c744c48b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.2.0/tinear-linux-arm64.tar.gz"
      sha256 "f5c88c79d1caab6128361dc35084b156c3d273dff63a459d78babcc07562d0f0"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.2.0/tinear-linux-amd64.tar.gz"
      sha256 "af2c498283237f57fd2bfddaf0b592a2a40506fccb621742badd6d83f3b6abb8"
    end
  end

  def install
    bin.install "tinear"
  end
end
