class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.56.0/kit_v0.56.0_darwin_arm64.tar.gz"
      sha256 "aaf2254c501caec33f5f8d90c4c2dd4c52754f17002a6be9a56a60d6cac5af73"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.56.0/kit_v0.56.0_darwin_amd64.tar.gz"
      sha256 "6f4c20100f1818a267f706b9cd63a3206702f0a36a73305a0ff9f13b2242590b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.56.0/kit_v0.56.0_linux_arm64.tar.gz"
      sha256 "93e6d6d85327587a53f06be4a46f7537ed5e48f52667f3c227ae2f65189f0315"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.56.0/kit_v0.56.0_linux_amd64.tar.gz"
      sha256 "633004d3f28c298546ea9c66dc889b893c1527b210db2f37b646086c481db4d5"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.56.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
