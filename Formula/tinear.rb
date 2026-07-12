class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.7.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.7.0/tinear-darwin-arm64.tar.gz"
      sha256 "b76bb634bb74ed4b9cb2972867183f04b3e37e499d4228d381e85bc354f405ae"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.7.0/tinear-darwin-amd64.tar.gz"
      sha256 "2c221fb4e054bb50930063d0e3fa71aca1482cf13f192f5163071e8766a0bfa3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.7.0/tinear-linux-arm64.tar.gz"
      sha256 "1ebf2b4f69c8fb2446bec3d5c862d842210f518850546064d9d83c53fd15ab66"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.7.0/tinear-linux-amd64.tar.gz"
      sha256 "cc96e0889094648c7a4a281bd1b9a48788e5b811ec5ac55edb4ff73a318f88d8"
    end
  end

  def install
    bin.install "tinear"
  end
end
