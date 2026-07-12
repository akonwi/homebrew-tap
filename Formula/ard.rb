class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.27.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.27.0/ard_v0.27.0_darwin_arm64.tar.gz"
      sha256 "fd889f05b2a55d8054e8e67408cf4ac4b44fd4d2a1a629f58b6bf795119dae69"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.27.0/ard_v0.27.0_darwin_amd64.tar.gz"
      sha256 "87d48484232c8dbaca519aa7260dabc1b975346f9bd138c927819ea0a14e0788"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.27.0/ard_v0.27.0_linux_arm64.tar.gz"
      sha256 "dce6e6dd235eb55b1c2f4cd0d78afb18e5f71823e2d96f9d6c9a820a2bf6e21a"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.27.0/ard_v0.27.0_linux_amd64.tar.gz"
      sha256 "d5ec21597b190190c75033bdc9922eeb0cf8f4c631829093d707891de06497e4"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.27.0", shell_output("#{bin}/ard version")
  end
end
