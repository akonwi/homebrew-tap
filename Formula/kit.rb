class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.43.0/kit_v0.43.0_darwin_arm64.tar.gz"
      sha256 "05b7f0ecdd83d94ee7d3fb9f2348a5e10101fe4234495729477671d635237d60"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.0/kit_v0.43.0_darwin_amd64.tar.gz"
      sha256 "7a87bffdb76fece88f61312a2d7c73dd85eecdebd8ad879a851fd65affea31f0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.43.0/kit_v0.43.0_linux_arm64.tar.gz"
      sha256 "c030a15263b906c3d837aee4e61341e5d4a7131779aae74b19ef9ecfad2ced30"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.43.0/kit_v0.43.0_linux_amd64.tar.gz"
      sha256 "2aca809765b9a2b00cd30c4c4b0510627037df58c9954767b7b0e35c3bf5aa11"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.43.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
