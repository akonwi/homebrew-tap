class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.47.0/kit_v0.47.0_darwin_arm64.tar.gz"
      sha256 "f4e8e556d976834e1ae92b68e791b9e0c2d69d8fdde46c5c610d226dfca3542a"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.47.0/kit_v0.47.0_darwin_amd64.tar.gz"
      sha256 "eef048ea43cc53a43138a3b25459d358ddfca81765300248fca9095ea488c44d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.47.0/kit_v0.47.0_linux_arm64.tar.gz"
      sha256 "baacbe846c6fa532ca0384e862283e53c85d6dbcf32d2c17ef9225020dc2b964"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.47.0/kit_v0.47.0_linux_amd64.tar.gz"
      sha256 "37002dc22dbc77981e43890986b918e95f41ff5d42e8ddfd11575a8fdd1ab1a3"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.47.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
