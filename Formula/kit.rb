class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.66.0/kit_v0.66.0_darwin_arm64.tar.gz"
      sha256 "dac09efd585bcbef9662adc133746922aa4e91fd0a9783d77d54492bc8ba70fa"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.66.0/kit_v0.66.0_darwin_amd64.tar.gz"
      sha256 "959834da5b87e7349c87266b6258cf931b0069ae32cd1a530ec391134430fbbb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.66.0/kit_v0.66.0_linux_arm64.tar.gz"
      sha256 "5833fc87c0a319aa0d6455a72ef6b69a63da3a1994c37946487925d61bea3169"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.66.0/kit_v0.66.0_linux_amd64.tar.gz"
      sha256 "37edd0f02b582e2448d2553948b345be57fb2a4f8f5c3b922a77a9b271671a93"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.66.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
