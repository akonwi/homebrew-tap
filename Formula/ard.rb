class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.35.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.35.1/ard_v0.35.1_darwin_arm64.tar.gz"
      sha256 "82de52afe115043ad14fee8a108d457fb9405136f7b9bf52b139f8c98824698f"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.35.1/ard_v0.35.1_darwin_amd64.tar.gz"
      sha256 "967fe5a2116e63fa5be28b42eb24e9a85f797211f4ebbbd4d6c7b6e739e177e2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.35.1/ard_v0.35.1_linux_arm64.tar.gz"
      sha256 "9dfdb1fe8c852e9f1d8c831d8b51d019bb4e6adc30a3963b6d5eb451398a67db"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.35.1/ard_v0.35.1_linux_amd64.tar.gz"
      sha256 "1ba185003a82870195c104440483c3f20bc1db95ddbe996efa2c01eaf908bcf7"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.35.1", shell_output("#{bin}/ard version")
  end
end
