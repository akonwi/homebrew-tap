class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.31.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.31.0/ard_v0.31.0_darwin_arm64.tar.gz"
      sha256 "dc9abc06d5c1931ca7acfccfdd3fd3035e33132e7737debeef9cf329ef341e4e"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.31.0/ard_v0.31.0_darwin_amd64.tar.gz"
      sha256 "b56b326b13e6dd9cbadb0c1772ed983e2967fada25d387b8e115da0264bd5088"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.31.0/ard_v0.31.0_linux_arm64.tar.gz"
      sha256 "e479f6fbaa7bb40d5fd0684e595e82872555e26d8f50c390e27b9839abe3f8ea"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.31.0/ard_v0.31.0_linux_amd64.tar.gz"
      sha256 "d838288029396291539454d7a94e93eee708036a576aa6aea168a83a049b07a1"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.31.0", shell_output("#{bin}/ard version")
  end
end
