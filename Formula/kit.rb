class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.36.2"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.36.2/kit_v0.36.2_darwin_arm64.tar.gz"
      sha256 "d4601db7e0db3b949cc4eb7426889a1e69933286e927fdc0f22894cce7605dfc"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.2/kit_v0.36.2_darwin_amd64.tar.gz"
      sha256 "be159af55495f86f5d1fec9e5e792ea7f432d4eb13d08906cd298cb18bdeec5a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.36.2/kit_v0.36.2_linux_arm64.tar.gz"
      sha256 "7ee1ef4580c1c01d3e73679c608c9f9f41dab76b85419369085f25fbc2a4d30e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.2/kit_v0.36.2_linux_amd64.tar.gz"
      sha256 "220af67afd102dca6bcd7713248057fb05608ea64e1a53f3f4a400c6bda8daa2"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.36.2 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
