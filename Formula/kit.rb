class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.52.0/kit_v0.52.0_darwin_arm64.tar.gz"
      sha256 "5dc69f4ef2bf1d857e94a770a77347b698624ada04f722ded2672e70c5a55b64"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.52.0/kit_v0.52.0_darwin_amd64.tar.gz"
      sha256 "d72ab3d56c3b3881213700b71ba6a886c4882d28dc946bea53d4adb7067d6c35"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.52.0/kit_v0.52.0_linux_arm64.tar.gz"
      sha256 "73cffba1e3721810b2229fbb6651ad9633c2d1eb1a1646c167611019651ff59a"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.52.0/kit_v0.52.0_linux_amd64.tar.gz"
      sha256 "9ae3c1e5c04e3c6d7e41ac5e87a2e8b2160a86b46a4751239ea3d10f043fef06"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.52.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
