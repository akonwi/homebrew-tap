class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.26.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.26.0/ard_v0.26.0_darwin_arm64.tar.gz"
      sha256 "53446f2d39941a4f25b74725554c99fe7c311d3465ec10b42a9534ce4252c448"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.26.0/ard_v0.26.0_darwin_amd64.tar.gz"
      sha256 "d00331bab12f47896fbf8c7a263100a765959cf8180f096b134dc5dfd3e8e33f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.26.0/ard_v0.26.0_linux_arm64.tar.gz"
      sha256 "26cf12d7616bc2e609c9a94810c02fa57adf3b5723a7673181f19c5a78ff1daf"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.26.0/ard_v0.26.0_linux_amd64.tar.gz"
      sha256 "1201f61cdac90bf61d3965683cbf13332c8540b96d2955bc5f8e997672b3e39f"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.26.0", shell_output("#{bin}/ard version")
  end
end
