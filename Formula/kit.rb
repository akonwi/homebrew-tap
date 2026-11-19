class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.65.0/kit_v0.65.0_darwin_arm64.tar.gz"
      sha256 "c029091fcc07e242deee5ac40ea8fc3d31ea1ffc94d925490d9c714bab7dfd56"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.65.0/kit_v0.65.0_darwin_amd64.tar.gz"
      sha256 "5e980d7f19c078b8bad6f947eae4450da6523891cdfbf377c04b2a5da115d7b4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.65.0/kit_v0.65.0_linux_arm64.tar.gz"
      sha256 "86e29db2bb43990d34098429e500cf674cb84acb3b1a066aba6af8b2a5e93f99"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.65.0/kit_v0.65.0_linux_amd64.tar.gz"
      sha256 "67946f33a4216303266cbbd09530e6307c97938406935166b419d5e8113ba984"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.65.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
