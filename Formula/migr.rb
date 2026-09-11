class Migr < Formula
  desc "Database migration tool"
  homepage "https://github.com/akonwi/migr"
  version "0.1.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/migr/releases/download/v0.1.2/migr-darwin-arm64.tar.gz"
      sha256 "95dcb5ed5167135b1df79c78b33f09431328364e54552a2c97dfc21be8115101"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.2/migr-darwin-amd64.tar.gz"
      sha256 "a66d4ee2c366bd97e1c9a54595d6632acc9ee803a5e4b07deb1afcb650e6600f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/migr/releases/download/v0.1.2/migr-linux-arm64.tar.gz"
      sha256 "242a1d2f92ae494eb32c8174c990b1507cf129d6ba4850c475f26ba77d095982"
    else
      url "https://github.com/akonwi/migr/releases/download/v0.1.2/migr-linux-amd64.tar.gz"
      sha256 "f6080cbcb8ca93c9048189915c0126b4de805f724a5a5ad68064b8ada0b6d4c5"
    end
  end

  def install
    bin.install "migr"
  end
end
