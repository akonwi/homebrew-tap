class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.10.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.10.0/tinear-darwin-arm64.tar.gz"
      sha256 "85c35e1fdf36b5ac4068c57859bf8a65f64d84f9a52c6b7fa3aa6dad44a71a4c"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.10.0/tinear-darwin-amd64.tar.gz"
      sha256 "c552ab34c9b7e7e650c79835a2eb171ae3c3921d1348c0cd1cbd0da30d354114"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.10.0/tinear-linux-arm64.tar.gz"
      sha256 "0e6810ca2ac5bdb50138d8a690e80b79fd3bbab1cbdb2c75e801f697b38ec40e"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.10.0/tinear-linux-amd64.tar.gz"
      sha256 "68806313fe7827b73a5481e8014c0fa452736174826feac5fbccff5f42857304"
    end
  end

  def install
    bin.install "tinear"
  end
end
