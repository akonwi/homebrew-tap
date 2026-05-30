class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.21.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.21.0/ard_v0.21.0_darwin_arm64.tar.gz"
      sha256 "7e483c8fa61121024e9fa0c35167dcac67a2aa62a7ea0802318d8eb855204701"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.21.0/ard_v0.21.0_darwin_amd64.tar.gz"
      sha256 "521dc9548678882717cb66c843bd9b758cb0d16085492ff4dd06255a4595937d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.21.0/ard_v0.21.0_linux_arm64.tar.gz"
      sha256 "b5da95ee7d81bd66bb776cea79ef0adea109df69eb3710a5c1c417f40a193f85"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.21.0/ard_v0.21.0_linux_amd64.tar.gz"
      sha256 "2853e3b57325e52601bbb223422d2f4406e8301c5547c98534f9e94fa30ad71a"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.21.0", shell_output("#{bin}/ard version")
  end
end
