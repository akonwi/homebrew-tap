class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.23.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.23.0/ard_v0.23.0_darwin_arm64.tar.gz"
      sha256 "f1b57bd6e195a3fdb0349b572cb1d4d1bd8f5c0c0102f441b81314d2a0ca045a"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.23.0/ard_v0.23.0_darwin_amd64.tar.gz"
      sha256 "81d928e215e821ddf0cdff40286e1760a379f85aea22c808555c5bbfdae4568c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.23.0/ard_v0.23.0_linux_arm64.tar.gz"
      sha256 "d61e4966891f19590451525fc2afc6c344b36c199196644a96f534ddeb620ab0"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.23.0/ard_v0.23.0_linux_amd64.tar.gz"
      sha256 "35f9c275abc971dc79be6d018d3b6b01ca92401b6fd309dd38e530ab998973e1"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.23.0", shell_output("#{bin}/ard version")
  end
end
