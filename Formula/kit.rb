class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.50.0/kit_v0.50.0_darwin_arm64.tar.gz"
      sha256 "41270b45c9219d4a46984376084829cf617591e1a35433f0da8ceb1d830c3964"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.50.0/kit_v0.50.0_darwin_amd64.tar.gz"
      sha256 "a143d90286f17e63f010ae5d3713e01dee75307b84640cc8c73e2095e019a90d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.50.0/kit_v0.50.0_linux_arm64.tar.gz"
      sha256 "5e5922e7cf8f7c21f0d8b0e7ab219586ac98a944f66312b08495ac11879c2537"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.50.0/kit_v0.50.0_linux_amd64.tar.gz"
      sha256 "aed713b425febabcf3d973e1191b5e2e7f41acaed3069d3827e14b6d1910772d"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.50.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
