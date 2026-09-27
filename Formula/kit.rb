class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.37.0"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.37.0/kit_v0.37.0_darwin_arm64.tar.gz"
      sha256 "b87e7f3981adf26475b78fa3c7b2476fc73fb58eb32924c0d4c9581228875764"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.37.0/kit_v0.37.0_darwin_amd64.tar.gz"
      sha256 "579935e7ead18dd5b50671d5e1d477ba18fde61369a10e699c80e78398ec3af3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.37.0/kit_v0.37.0_linux_arm64.tar.gz"
      sha256 "c22dd3b795e93f323e05a07860a7490d4ee627cdcfb8220ec2812cd057b14c51"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.37.0/kit_v0.37.0_linux_amd64.tar.gz"
      sha256 "18f9658e7cb2303209bc5b32b4962f8be405e10459d652937784ebcd0a9a0fef"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.37.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
