class Migr < Formula
  desc "Database migration tool"
  homepage "https://github.com/akonwi/migr"
  version "0.1.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/migr/releases/download/v0.1.1/migr-darwin-arm64.tar.gz"
      sha256 "3c6f9c86829130ace191946f384fe85ff61cc6ae132696d0e483a595d9673db3"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.1/migr-darwin-amd64.tar.gz"
      sha256 "47ff875abc57ffa0c6a83980fc714e410fc3fe108bf31996d4c3929323fc2a5d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/migr/releases/download/v0.1.1/migr-linux-arm64.tar.gz"
      sha256 "49328783ed5fa126554e422cdd04cb90081ba3111baedea39c960af07fae7da3"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.1/migr-linux-amd64.tar.gz"
      sha256 "05d693b8de1ede54db6c80032b07a691994003cfc5fef6c4cd453bf73f220e17"
    end
  end

  def install
    bin.install "migr"
  end
end
