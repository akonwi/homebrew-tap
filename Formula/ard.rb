class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.29.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.29.0/ard_v0.29.0_darwin_arm64.tar.gz"
      sha256 "c154a7e69a577486d018079eed392657a4007ce29824064d70c069f3c6574b91"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.29.0/ard_v0.29.0_darwin_amd64.tar.gz"
      sha256 "5f1c1bcbd24924a35ffaeba59c5399490dde871ab6239a439429e02e9a7c9e52"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.29.0/ard_v0.29.0_linux_arm64.tar.gz"
      sha256 "79fd588cb2596d7082e661702683e5f22b298d9dfeba3bde5fac7fb42e9d4b62"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.29.0/ard_v0.29.0_linux_amd64.tar.gz"
      sha256 "51f08b025976b4b9c85a72950cb7a51dba1cbb74b115829cc44a5a50a5da7ced"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.29.0", shell_output("#{bin}/ard version")
  end
end
