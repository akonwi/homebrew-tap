class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.60.0/kit_v0.60.0_darwin_arm64.tar.gz"
      sha256 "a49942f400ed8afc94ddcfc5f5e9a48c0abf4fcc01a8b99d999659310f67713b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.60.0/kit_v0.60.0_darwin_amd64.tar.gz"
      sha256 "d8a8ed9f7922c4040f26897b3890fca3b2fdabe4831fbc7bbff9f4c1eb204f94"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.60.0/kit_v0.60.0_linux_arm64.tar.gz"
      sha256 "a8d9929e0cde554eec98cb41433eb73270d8ed975a6b99830e3654acc8154a52"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.60.0/kit_v0.60.0_linux_amd64.tar.gz"
      sha256 "c0397b488598b3913124bf97bb073930e2c43d40da247a49961ebb1008d58fe6"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.60.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
