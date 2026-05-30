class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-darwin-arm64.tar.gz"
      sha256 "24f66ff7016c4771bf9bb19c359b68f520c0d84e968868ecae5033d90acea182"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-darwin-amd64.tar.gz"
      sha256 "c5fcffb3033cf095d8c9b1b6a66a53661e32a4b46764613bf1f4e3ca8aa7c659"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-linux-arm64.tar.gz"
      sha256 "6fad0d87d0b517091ca85ada7546034bb9c4f2e63791d369ed997e1886fd0b9d"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.1.0/tinear-linux-amd64.tar.gz"
      sha256 "66d61827521a137e33a9a4e950546f81f4928318d0320a8c710cea247f255c04"
    end
  end

  def install
    bin.install "tinear"
  end
end
