class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.43.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.43.1/ard_v0.43.1_darwin_arm64.tar.gz"
      sha256 "29fa980b0de95aa1a5b3ad1b80a23ea16b700fecd4baa47ac1210968afdd4546"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.43.1/ard_v0.43.1_darwin_amd64.tar.gz"
      sha256 "0257f63f591b6e4f6083359df6fada0e5d48e3ee9b63b6acad4bc1e8590559b5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.43.1/ard_v0.43.1_linux_arm64.tar.gz"
      sha256 "b8a55a475943dfb9cef6bf4d20b594f9193c5737b2ee7b7c3792a3ced1416836"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.43.1/ard_v0.43.1_linux_amd64.tar.gz"
      sha256 "2681a6c644774d0b47d21df25228d4d785656659e62fbf1560783f12441294fe"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.43.1", shell_output("#{bin}/ard version")
  end
end
