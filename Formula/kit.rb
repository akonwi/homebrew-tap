class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.51.0/kit_v0.51.0_darwin_arm64.tar.gz"
      sha256 "ee0c81252db6261d269b2b6a75dd693497ced9c95070fcdf6bb7473621256f4b"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.51.0/kit_v0.51.0_darwin_amd64.tar.gz"
      sha256 "0153c4786ae220c36e8ba891921f5c69a086a712683877df16e133a2a9d9834a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.51.0/kit_v0.51.0_linux_arm64.tar.gz"
      sha256 "ddd22abebde03b1104a036cba9af557da47f54dec0e39efdc45a825ed575677f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.51.0/kit_v0.51.0_linux_amd64.tar.gz"
      sha256 "1f5a29742e8ac0bc428c4a5a96c545b490cec7490c0374aac8aed6a079f5643d"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.51.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
