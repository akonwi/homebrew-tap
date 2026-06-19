class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.4.0/tinear-darwin-arm64.tar.gz"
      sha256 "1d9303df5ee154da95f690b915c7a24695be1cb2b2894d77e8c946239fa538e7"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.4.0/tinear-darwin-amd64.tar.gz"
      sha256 "0a0cd9b22530d9c5a0207b0c38676cf881f316cb24b29f4e4e050d4be2430a8f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.4.0/tinear-linux-arm64.tar.gz"
      sha256 "5040ca2afb5e804cbd7fea552eb2d82e1cd73f09e5cae4734683957a5d27b78e"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.4.0/tinear-linux-amd64.tar.gz"
      sha256 "36722ce1ca6fe1fbc0fa27ea55785214a577926b65517f4e40d2013e94822d78"
    end
  end

  def install
    bin.install "tinear"
  end
end
