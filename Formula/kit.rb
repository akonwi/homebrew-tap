class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.43.1/kit_v0.43.1_darwin_arm64.tar.gz"
      sha256 "014d6ef00025b4ab388437235e99f7a5b76bb47f248684d8d440a371609d297e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.1/kit_v0.43.1_darwin_amd64.tar.gz"
      sha256 "ff0031b751e15e3bdd8bdcefe71785708aa0379d901033ee5fed9f07000ca9a1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.43.1/kit_v0.43.1_linux_arm64.tar.gz"
      sha256 "1914cbe7d5f884ef0c995b0a21cf47ad27fefe10afa6c818fcb57fa4fd7cd116"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.1/kit_v0.43.1_linux_amd64.tar.gz"
      sha256 "4bb6c1cadcd7f231c2de7abaaa9ef9572a92e71a342ad12ca4b034a58e375af4"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.43.1 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
