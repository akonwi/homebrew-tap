class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.21.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.21.2/kit_v0.21.2_darwin_arm64.tar.gz"
      sha256 "cde02e6820cf36259b5c939fa43d03ae1746637882fbc58602e0c4c06359a586"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.2/kit_v0.21.2_darwin_amd64.tar.gz"
      sha256 "f1f7b25e5767b33bf5cef5d8d65a0cac13b51b28d805939fdead026d12157c4f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.21.2/kit_v0.21.2_linux_arm64.tar.gz"
      sha256 "59354043666adeee50060e01135ae1bd5f916252fbe92b41ee58f3ba8e3cc430"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.21.2/kit_v0.21.2_linux_amd64.tar.gz"
      sha256 "48f197d11256cfc59629acad3f47f6a83edc5ac4617cd285c4253ffd22094bc9"
    end
  end

  def install
    # The binary locates its runtime assets (tree-sitter worker,
    # grammars) relative to the resolved executable path, so install
    # both under libexec and symlink the binary into bin.
    libexec.install "kit", "runtime"
    bin.install_symlink libexec/"kit"
  end

  test do
    assert_match "v0.21.2", shell_output("#{bin}/kit version")
  end
end
