class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.45.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.45.0/ard_v0.45.0_darwin_arm64.tar.gz"
      sha256 "a5b1f35190a2167726687eaaeb25da6a9a82b4b8b0220a1cd7d2cbed2ebab61d"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.45.0/ard_v0.45.0_darwin_amd64.tar.gz"
      sha256 "94aa68095100a5ad1198c3baafdb5393f72431d0e47951a13763470e0ce5c5fa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.45.0/ard_v0.45.0_linux_arm64.tar.gz"
      sha256 "0cf733b30bd39b08ee0530e7d49a0b482f5629b0f461b98aaa77e4a0afb575cd"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.45.0/ard_v0.45.0_linux_amd64.tar.gz"
      sha256 "9a293422c1467cc163d6e85e40e5c4167d274f7710b93a565488b511f9b3cfa7"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.45.0", shell_output("#{bin}/ard version")
  end
end
