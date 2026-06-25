class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.5.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.5.0/tinear-darwin-arm64.tar.gz"
      sha256 "f41704d67ac666e79bfdf78104e126faeaff5ee351dcf6b8294328314834a083"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.5.0/tinear-darwin-amd64.tar.gz"
      sha256 "9f5d309c8c80f51d220d67a6199c089626b0171b3031209bd2282e60863e0a77"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.5.0/tinear-linux-arm64.tar.gz"
      sha256 "76fbb2660b0f1bb4513fd305315fed075a93fcd9ffdfa61d0d52c464681322c3"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.5.0/tinear-linux-amd64.tar.gz"
      sha256 "3b40e3a12ace1499ba524bc7a62970e70649f83d56a0609c408ccfc229fb88fb"
    end
  end

  def install
    bin.install "tinear"
  end
end
