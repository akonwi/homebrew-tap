class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.36.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.36.0/ard_v0.36.0_darwin_arm64.tar.gz"
      sha256 "61dedeacfa462c1a006c06f38b0a958d53d87babe54c2f2dceeca55a52651673"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.36.0/ard_v0.36.0_darwin_amd64.tar.gz"
      sha256 "048f8fcc5707737fee43a16529aaeb069fbf6abd1367dffba3e2369bcdab3364"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.36.0/ard_v0.36.0_linux_arm64.tar.gz"
      sha256 "4502044dc74c51b4678a63ab044919c4c0506c3cb303c251cf335bd4dfd885dc"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.36.0/ard_v0.36.0_linux_amd64.tar.gz"
      sha256 "f32481308905730e16d11174ba4516b44ca38a005359a6765fef12180ed00f5f"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.36.0", shell_output("#{bin}/ard version")
  end
end
