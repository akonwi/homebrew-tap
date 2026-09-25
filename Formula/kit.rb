class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.36.0"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.36.0/kit_v0.36.0_darwin_arm64.tar.gz"
      sha256 "f2d0c2c7729d392106b7e4ea2a2400b8ad980ab6c877775e8680ac76f527da3e"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.0/kit_v0.36.0_darwin_amd64.tar.gz"
      sha256 "e7af2b56343724b36151899e6d90d136c2a393486c278931e7ed2a56e6706749"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.36.0/kit_v0.36.0_linux_arm64.tar.gz"
      sha256 "7671f0fb79e83d2d8b9a3b99844ba54d04cf5bfaee382cc99c6cd461b2ac1838"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.0/kit_v0.36.0_linux_amd64.tar.gz"
      sha256 "13e9f9070fad7f26fda1c071c1f462f92dd7c9f16cd98459306d04723ce8fc02"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.36.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
