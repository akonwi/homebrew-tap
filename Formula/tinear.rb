class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.11.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.11.0/tinear-darwin-arm64.tar.gz"
      sha256 "c2dfe65a8ecc865a1d6bc5877e14984a74728fb77262785d7540a1f41d147e22"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.11.0/tinear-darwin-amd64.tar.gz"
      sha256 "9fcd99d83bae70d1768215442d222363ef19dc750ec079250bf626c58c9f557e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.11.0/tinear-linux-arm64.tar.gz"
      sha256 "c48c92c53746385ee8de99c1f7786a990da405595cf53ff7ef95a2a6c1d1b14e"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.11.0/tinear-linux-amd64.tar.gz"
      sha256 "f66773682393331092af001d8d3abbca4649acef498420e038d8e77fd47e300f"
    end
  end

  def install
    bin.install "tinear"
  end
end
