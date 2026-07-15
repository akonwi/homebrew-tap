class Tinear < Formula
  desc "Terminal UI for Linear"
  homepage "https://github.com/akonwi/tinear"
  version "0.9.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/tinear/releases/download/v0.9.0/tinear-darwin-arm64.tar.gz"
      sha256 "2984eff448b5cb94dc44b9f232b4f39fd06b95951fd1b7aaa7239a68668d9b07"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.9.0/tinear-darwin-amd64.tar.gz"
      sha256 "5e460ac56bf40bf28c1ee30f0a4f38d145e53729b4e5773375ad3525577a22cd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/tinear/releases/download/v0.9.0/tinear-linux-arm64.tar.gz"
      sha256 "d9b781fb4102de46865ffe510f982c2e94993fac8f9b1fc101da4dd880c97ae1"
    else
      url "https://github.com/akonwi/tinear/releases/download/v0.9.0/tinear-linux-amd64.tar.gz"
      sha256 "37691c1fc8972dfc72b74098a9b800f7105587b1f93f40b28d4c4ffce177834a"
    end
  end

  def install
    bin.install "tinear"
  end
end
