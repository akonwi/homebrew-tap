class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.59.0/kit_v0.59.0_darwin_arm64.tar.gz"
      sha256 "7cbe65a0bca35d6fb29af9456866cb5857cc3694213511ceb5d278215f8394c5"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.59.0/kit_v0.59.0_darwin_amd64.tar.gz"
      sha256 "4048fd7725b0ff511ab67a1702efa04f2a809fe28f046517c2db9f363997fd57"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.59.0/kit_v0.59.0_linux_arm64.tar.gz"
      sha256 "ce0a47b1c16bec3beea27510dc12ac6ac44e20d7fbd12fedc0cb4c33df387aaa"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.59.0/kit_v0.59.0_linux_amd64.tar.gz"
      sha256 "1d4b27dc6be7349c0cbb51cc42f44b9aa1210acb2ec891379bad670bc8d82159"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.59.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
