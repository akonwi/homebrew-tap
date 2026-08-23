class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.39.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.39.0/ard_v0.39.0_darwin_arm64.tar.gz"
      sha256 "17cc548c2ae6eed23b572ad67c2c97bfba8576790d713527572aa3b8b3b9f967"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.39.0/ard_v0.39.0_darwin_amd64.tar.gz"
      sha256 "ed81414d82b6a92fb0016f24cb6aa98a0b35ddca2be29aa2f88110da2b3f13c3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.39.0/ard_v0.39.0_linux_arm64.tar.gz"
      sha256 "8aeda1661c21c8f1ef6da05b17d9e47b120dcaf750a8cacd246dce9c60287d10"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.39.0/ard_v0.39.0_linux_amd64.tar.gz"
      sha256 "b6272c30c5a185a9191ff8a985c1e793c825b9cc495bd98e9e92dac9220b7f38"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.39.0", shell_output("#{bin}/ard version")
  end
end
