class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.37.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.37.0/ard_v0.37.0_darwin_arm64.tar.gz"
      sha256 "75373271ac80208fa44ed3e7bbbf37b3ab03f5d837b55b0237900c90fa33c1c3"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.37.0/ard_v0.37.0_darwin_amd64.tar.gz"
      sha256 "d5ce70e25e6c1bb972115deb106d0e30de74b7270ad5ddc868114eb55156fbec"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.37.0/ard_v0.37.0_linux_arm64.tar.gz"
      sha256 "5c3aff9c3ef9094662bdc1f51ce266fe3324f3a71c6d1b29f2033c44f548f545"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.37.0/ard_v0.37.0_linux_amd64.tar.gz"
      sha256 "6491b80840aa13546c05e319a46a718bebba05344a053a9e9cd46081125fb8aa"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.37.0", shell_output("#{bin}/ard version")
  end
end
