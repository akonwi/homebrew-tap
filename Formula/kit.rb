class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.38.0"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.38.0/kit_v0.38.0_darwin_arm64.tar.gz"
      sha256 "66ca755e425f1f01e7a03e2094f69b106f86eb1cee91270b96d43f07202c7e54"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.38.0/kit_v0.38.0_darwin_amd64.tar.gz"
      sha256 "d0be288b8004d91d1c2a1feda599d69c51eb3b8649c505d86afa624b7d52a31b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.38.0/kit_v0.38.0_linux_arm64.tar.gz"
      sha256 "32aec97a0732bb58eaf04d6442adb20f7f1e107984201558537f75fe694c572f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.38.0/kit_v0.38.0_linux_amd64.tar.gz"
      sha256 "f1128c6c6838c8b6dfa770eab115de14d78ba84627706c98daa7bac0eb2e23ef"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.38.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
