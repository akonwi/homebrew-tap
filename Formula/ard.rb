class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.28.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.28.0/ard_v0.28.0_darwin_arm64.tar.gz"
      sha256 "520bea2faf0a770d7371dfc72d133ea62700b8b053d03da6df14bfcc7a856668"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.28.0/ard_v0.28.0_darwin_amd64.tar.gz"
      sha256 "947274a104414624dda30fbcb7874c5924704a4a53679e1f2c994e0f2a3eaa2f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.28.0/ard_v0.28.0_linux_arm64.tar.gz"
      sha256 "035614ddb7bcd0a06a6a05f316a16ce37808ad27c807d760229bf37c8053d502"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.28.0/ard_v0.28.0_linux_amd64.tar.gz"
      sha256 "13be77b68fe4fc01ff7a8d4d345632ee39c75129225fd66aaf7dcf6af2abe68d"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.28.0", shell_output("#{bin}/ard version")
  end
end
