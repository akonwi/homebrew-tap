class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.48.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.48.0/ard_v0.48.0_darwin_arm64.tar.gz"
      sha256 "8c89bdbc1894625ab092584f8a808d66d862fd5512b82624d7e32346f6288417"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.48.0/ard_v0.48.0_darwin_amd64.tar.gz"
      sha256 "2cf4e267513081e506a811939e0eafcaaa926aab13683f5ccb763620aa0a9ed9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.48.0/ard_v0.48.0_linux_arm64.tar.gz"
      sha256 "b1c51fa8ab16b5d52dc84e326efbd42fd5a34bc7ba6dd0184470e83f05f5bb68"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.48.0/ard_v0.48.0_linux_amd64.tar.gz"
      sha256 "d26388cc8f5dd52b070817e016d79b02987efd069774c87a990e2f29bfcd36fd"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.48.0", shell_output("#{bin}/ard version")
  end
end
