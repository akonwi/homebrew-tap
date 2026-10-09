class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.42.0/kit_v0.42.0_darwin_arm64.tar.gz"
      sha256 "1238c38dd6f309b117d047933e0f23554005a80014c596ebacb4e218619918c1"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.42.0/kit_v0.42.0_darwin_amd64.tar.gz"
      sha256 "7a47711e635093be29e32c303c01212389b3b8a482bac080fed42733094bbdfa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.42.0/kit_v0.42.0_linux_arm64.tar.gz"
      sha256 "822d43bf549447e2ff6984de95c0f501dbda81c95c904ba5f5c3eeee809da623"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.42.0/kit_v0.42.0_linux_amd64.tar.gz"
      sha256 "ca745dccc448751d435d791339bcfebc0adf13f9ab093e39af5299f8cfe36e58"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.42.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
