class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.30.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.30.0/ard_v0.30.0_darwin_arm64.tar.gz"
      sha256 "4bee04d9c2af0a186ae88f60830d43b3a8ef969fcbc0bcdc5c209186fe7a9221"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.30.0/ard_v0.30.0_darwin_amd64.tar.gz"
      sha256 "dc346cb951d71cbc6ed5935f2ae74f2cd86d1410b5503c35b246d525d78e14a9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.30.0/ard_v0.30.0_linux_arm64.tar.gz"
      sha256 "419a2319383ec3dd92841bec5468122d8543cf9be17daba63436e5220196b0fd"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.30.0/ard_v0.30.0_linux_amd64.tar.gz"
      sha256 "b20c29232dba768a2e620d8c6707357e45ae2ae1985faba3358bf21c08af3466"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.30.0", shell_output("#{bin}/ard version")
  end
end
