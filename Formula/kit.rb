class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.64.0/kit_v0.64.0_darwin_arm64.tar.gz"
      sha256 "423171b98552d1856737fbc882d2b7d654214fc5d64101cd21a3adf1a16afb99"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.64.0/kit_v0.64.0_darwin_amd64.tar.gz"
      sha256 "eb8a0ff780cf68977574f57b6d3cbc0e879fb4d721b5bd96bb970575e5103852"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.64.0/kit_v0.64.0_linux_arm64.tar.gz"
      sha256 "940c1fd2dcc39221034b92a0e0c16f29f02d0e774c11c130645a5a5565b345e6"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.64.0/kit_v0.64.0_linux_amd64.tar.gz"
      sha256 "9c1ca0840cceb17fa0fcded233e6524cb2c0500f51e3d35dc5129e068a4a42dc"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.64.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
