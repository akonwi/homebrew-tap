class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.46.1/kit_v0.46.1_darwin_arm64.tar.gz"
      sha256 "6710ce1531d33af6062162f12e71933f0d831f47aa14a3d687648329e724e94a"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.46.1/kit_v0.46.1_darwin_amd64.tar.gz"
      sha256 "0c77e6f33967e2bde25f33759d291d8e080df9988f065414c4f47635fbe68fc9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.46.1/kit_v0.46.1_linux_arm64.tar.gz"
      sha256 "267cd828eef5b2652daff6571f148b6da4490673f4bba15bdc657ab289bca6a2"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.46.1/kit_v0.46.1_linux_amd64.tar.gz"
      sha256 "d472e5d852a7d28bf09d71e241a49faeda87028b6ae6cc72e0149ecfc715e485"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.46.1 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
