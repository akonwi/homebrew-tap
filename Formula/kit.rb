class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.44.0/kit_v0.44.0_darwin_arm64.tar.gz"
      sha256 "6154fa554843db339751961309b6417795afb5d40028f311f3bb4bb3910ac8da"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.44.0/kit_v0.44.0_darwin_amd64.tar.gz"
      sha256 "7ff35a9483680e8ed0df49daeafc118a34f4452c57f979a2dba4e8920d2d3e78"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.44.0/kit_v0.44.0_linux_arm64.tar.gz"
      sha256 "be249adfb2a293cb22ca3679f586a28cac284a71dd68e8d186e47eb1d3f8d2eb"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.44.0/kit_v0.44.0_linux_amd64.tar.gz"
      sha256 "dfd4fed87826db784195e66dc3a2a21ff8854ba3ff504f28d1bbf0374a4fca9c"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.44.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
