class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.49.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.49.0/ard_v0.49.0_darwin_arm64.tar.gz"
      sha256 "830449b0a8101a0dc6970a5504b8d19f7432dacaa049a958095feab40ff68124"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.49.0/ard_v0.49.0_darwin_amd64.tar.gz"
      sha256 "9febf0b9fd744cb300582834923b912a13023e66834578ec52e846a61d9981d9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.49.0/ard_v0.49.0_linux_arm64.tar.gz"
      sha256 "bf76590667aaaf9da67103771bb50ae04631ab209e7d56f1a50c28eb3adde643"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.49.0/ard_v0.49.0_linux_amd64.tar.gz"
      sha256 "5335e3c8fe7c195e4019b70369956edf69140fe52ad97129d53b0247f6bf396e"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.49.0", shell_output("#{bin}/ard version")
  end
end
