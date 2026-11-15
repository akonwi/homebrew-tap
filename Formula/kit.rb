class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.63.0/kit_v0.63.0_darwin_arm64.tar.gz"
      sha256 "9fc3f7220b291d14341e77a9e02f7047c4392f87e4870765296824851ad2a9fd"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.63.0/kit_v0.63.0_darwin_amd64.tar.gz"
      sha256 "4d072f828a1c9b05ec58ab95a7f1ec166647894c026803d1750a8d84a4ec6f9e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.63.0/kit_v0.63.0_linux_arm64.tar.gz"
      sha256 "13800506400cce741dd03fc365ccd579af72745aad4c96611c68c83669c0c643"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.63.0/kit_v0.63.0_linux_amd64.tar.gz"
      sha256 "1ee81ed34e2fe1086b3f11c14f2938278f48c1c233c4e0264627d3426e12bbd3"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.63.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
