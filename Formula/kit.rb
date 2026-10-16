class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.46.0/kit_v0.46.0_darwin_arm64.tar.gz"
      sha256 "e2eea4dd17de8f56ab5db1912c060b10348a9eeffe6d0478a26115ebe5842996"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.46.0/kit_v0.46.0_darwin_amd64.tar.gz"
      sha256 "8e2245dd383a0e0b8232ba8dcb8e37c740d9ad77f479737f5ae97cd391cbc98e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.46.0/kit_v0.46.0_linux_arm64.tar.gz"
      sha256 "60b9de8b6d826e0c1560eb520a407eb9d57ade846fd11b4da50e60efb7beabf9"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.46.0/kit_v0.46.0_linux_amd64.tar.gz"
      sha256 "be9180482aae98c48395688b2aafb7c42308a75127600f36209b966d562aa812"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.46.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
