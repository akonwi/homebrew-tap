class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.48.0/kit_v0.48.0_darwin_arm64.tar.gz"
      sha256 "291a67f718190725ea0ea98025931ac26909a3c60c41df4590847b0cce1c7650"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.48.0/kit_v0.48.0_darwin_amd64.tar.gz"
      sha256 "d21ee097b04d2d377a97d09565170926673b5fc4582009602e97e5271e642b28"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.48.0/kit_v0.48.0_linux_arm64.tar.gz"
      sha256 "c9134d360427eaa303304224ae3d4148dae6b327c856e09eedd39f998bfbe6dc"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.48.0/kit_v0.48.0_linux_amd64.tar.gz"
      sha256 "45154d955d7cae58e2f6aa6911395e67ad353ff6df16c00bc983279b41e9320a"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.48.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
