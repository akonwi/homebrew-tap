class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.42.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.42.0/ard_v0.42.0_darwin_arm64.tar.gz"
      sha256 "4f796f9b301947406ed1f69c381cb47514df9c16e9ee21111fc0ef4fbde1e94c"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.42.0/ard_v0.42.0_darwin_amd64.tar.gz"
      sha256 "97900c026972cebd8759343533e5e53520688213386121eef005393e2aee3363"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.42.0/ard_v0.42.0_linux_arm64.tar.gz"
      sha256 "da6f2c8ab2b9d4cf91bbda88872642b5cb00d09c5171ec9adf22381825f5cb1a"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.42.0/ard_v0.42.0_linux_amd64.tar.gz"
      sha256 "8cefa429556825607feba35567a7129ca04a75abbd89285be5baa4fc8be46ed1"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.42.0", shell_output("#{bin}/ard version")
  end
end
