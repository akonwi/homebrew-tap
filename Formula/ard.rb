class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.25.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.25.0/ard_v0.25.0_darwin_arm64.tar.gz"
      sha256 "65c6b577f8ecbb9936740bf0f6c93a7368ca6d0951cd2ad2f459a3f60a05ed68"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.25.0/ard_v0.25.0_darwin_amd64.tar.gz"
      sha256 "fa1036495242568bb5540a748fc7426830be8e800f9867a8f8b4482154ffd987"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.25.0/ard_v0.25.0_linux_arm64.tar.gz"
      sha256 "b01f0ef1e70104f5ee65cc327210f91c7308cf315fc6a586992350ca2bbf9a0a"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.25.0/ard_v0.25.0_linux_amd64.tar.gz"
      sha256 "f8180efb6be600cd970d9a361f869a46c55ea5c7c69b0afb4d0bdee219929c76"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.25.0", shell_output("#{bin}/ard version")
  end
end
