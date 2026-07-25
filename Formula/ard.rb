class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.32.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.32.0/ard_v0.32.0_darwin_arm64.tar.gz"
      sha256 "a660fd6e6c681dfcdef20f862478514fb576dfcadb461f4a1e0cf89425845d21"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.32.0/ard_v0.32.0_darwin_amd64.tar.gz"
      sha256 "b1d53a433d153a120e4cfcea188f420b7d018baa8589c8c83e9b97f1ae23375f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.32.0/ard_v0.32.0_linux_arm64.tar.gz"
      sha256 "747d5a9d2b393803dfe11639e6e9afff189b5978b1c929834134a42637cdbdd1"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.32.0/ard_v0.32.0_linux_amd64.tar.gz"
      sha256 "d9bc22ab8a4097ee029ea413a96d16ec140ed8a41a283b05f2551bf8177d1ef0"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.32.0", shell_output("#{bin}/ard version")
  end
end
