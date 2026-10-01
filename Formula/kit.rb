class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.39.0/kit_v0.39.0_darwin_arm64.tar.gz"
      sha256 "17dc8cfee720b5df30dbc0dae650a7ffe61033a452f045c48f4c271445835a08"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.39.0/kit_v0.39.0_darwin_amd64.tar.gz"
      sha256 "eb143fe10b20e8632c2fb0372b4397c597204e1abe6eb2ec636bc3823336890b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.39.0/kit_v0.39.0_linux_arm64.tar.gz"
      sha256 "5823c6c5ec952f59dc9e000444f2fe8466ed965a460f191a1b6d8014d25738ca"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.39.0/kit_v0.39.0_linux_amd64.tar.gz"
      sha256 "0d8b5317e453ab26ee0290564ca35420f71b5869288ff1a6cd2051813aa67c0a"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.39.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
