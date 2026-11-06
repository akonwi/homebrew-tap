class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.55.0/kit_v0.55.0_darwin_arm64.tar.gz"
      sha256 "1e5cb2a4c0694d50a07873700abb7b22632627b4de34a55e11e04cffe10ed02f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.55.0/kit_v0.55.0_darwin_amd64.tar.gz"
      sha256 "a61520713ca097ff0bc08b602cfcf9e4923ddd302cbe0a791e415402b379b001"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.55.0/kit_v0.55.0_linux_arm64.tar.gz"
      sha256 "1cc47b7311c06c16e6145995fc99c1e756f76e5573a1e415b27b1c05ff1935b6"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.55.0/kit_v0.55.0_linux_amd64.tar.gz"
      sha256 "bf279ded25933819e0cd7a94c2807a580b281f187f1c8e1c2a7c4356cbe7bced"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.55.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
