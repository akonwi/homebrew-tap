class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.22.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.22.0/ard_v0.22.0_darwin_arm64.tar.gz"
      sha256 "a09a847d65fa67939fdca09cbb9efecdcffc00f31297edbb8dc0812027869ad2"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.22.0/ard_v0.22.0_darwin_amd64.tar.gz"
      sha256 "a494d7738dffdb86663a30987a4a5a4f1fe84d6ec4a3967e232370dc6b6361b9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.22.0/ard_v0.22.0_linux_arm64.tar.gz"
      sha256 "99ac1ac94e61caa33052e361b522a7c63a4b7e4d108199ca16745bd31d8e116f"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.22.0/ard_v0.22.0_linux_amd64.tar.gz"
      sha256 "b72111f1be96d9166ab2ac9a110e60bc40b54d1181a8478ca46070baf61cf043"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.22.0", shell_output("#{bin}/ard version")
  end
end
