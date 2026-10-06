class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.40.0/kit_v0.40.0_darwin_arm64.tar.gz"
      sha256 "4bfb45b33bd01e97ee2577f97e8b4060e68661821b00378fde63276b0f47d70b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.40.0/kit_v0.40.0_darwin_amd64.tar.gz"
      sha256 "ba9f05da648b315d20dbc23cb269776a6ee180407702c7e512fa6319b2e6e232"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.40.0/kit_v0.40.0_linux_arm64.tar.gz"
      sha256 "7adc1c3c1201b629a76a08a3adc07d1cb430bcb7c0ba1a1ff1f8754fd12ac9a5"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.40.0/kit_v0.40.0_linux_amd64.tar.gz"
      sha256 "f528fc18e8fd9c595cd78755305bfca88bfdce81bcec66bec70c1546dbfda175"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.40.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
