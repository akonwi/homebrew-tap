class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.46.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.46.0/ard_v0.46.0_darwin_arm64.tar.gz"
      sha256 "a20aff74a26f291571088f286768678a4132c4bbf924b7a571e8964d664d6e1d"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.46.0/ard_v0.46.0_darwin_amd64.tar.gz"
      sha256 "6f24508b495f3bd9f84645da28bc62b6b0f6840b562349e6144b96512561b6e8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.46.0/ard_v0.46.0_linux_arm64.tar.gz"
      sha256 "178311686a0de4cf3c7999afbf017faa9ab883982f71a5fd962d2c3b472825e0"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.46.0/ard_v0.46.0_linux_amd64.tar.gz"
      sha256 "9294dd44e386652536c194f39f1202306c012d39cd80c841d5fedb54da3f7577"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.46.0", shell_output("#{bin}/ard version")
  end
end
