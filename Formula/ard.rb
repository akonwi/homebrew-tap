class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.40.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.40.0/ard_v0.40.0_darwin_arm64.tar.gz"
      sha256 "6c393871a86b6396d8b22c6c075713337c1442568b8c50839d9f73b1f3dbba74"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.40.0/ard_v0.40.0_darwin_amd64.tar.gz"
      sha256 "44e191a577a384855c4515870306c18dc6b77de75cd64c1e88acf00f00d540f5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.40.0/ard_v0.40.0_linux_arm64.tar.gz"
      sha256 "0c38969e2a09e2025b0f00d6a3b5ad3243459976123523e8099b7136edb88d05"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.40.0/ard_v0.40.0_linux_amd64.tar.gz"
      sha256 "b81529a329e69e9e0615dede01331332b04bedecef6fa75de178e85e509934ed"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.40.0", shell_output("#{bin}/ard version")
  end
end
