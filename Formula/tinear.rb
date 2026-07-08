class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.6.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.6.0/tinear-darwin-arm64.tar.gz"
      sha256 "a3eb650b069825b7a22421c68580c8171d4f247434760ad2f60f28444473ccec"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.6.0/tinear-darwin-amd64.tar.gz"
      sha256 "c0b8f0d1a198883ec8cef41fdc1cbe250d371121e19f989cfb37c3b23ba1f584"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.6.0/tinear-linux-arm64.tar.gz"
      sha256 "a9967aeb57ec1d5e028618f31555393208893647a5ef979bdd54acbb0808327e"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.6.0/tinear-linux-amd64.tar.gz"
      sha256 "216650d136876a9929fae5d2f9501651741f243cd9d9e002a342607f98c22601"
    end
  end

  def install
    bin.install "tinear"
  end
end
