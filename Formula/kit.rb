class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  version "0.36.1"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.36.1/kit_v0.36.1_darwin_arm64.tar.gz"
      sha256 "bf1501322f2aadd12c963e1e112922f059be87999ad7cbb94f2f2c40124401a9"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.1/kit_v0.36.1_darwin_amd64.tar.gz"
      sha256 "819147610bf6249fc58c706cf3a3dd76b310692ce442d77befedb56ec5ac5a5e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.36.1/kit_v0.36.1_linux_arm64.tar.gz"
      sha256 "cd4bbe3c025eaf29223836b200248b35063dd6dda6e886bf87887ad337911e4f"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.36.1/kit_v0.36.1_linux_amd64.tar.gz"
      sha256 "0e386cb8d0308ea04ea7c8091619ea14636f558ed65a9eb6721276ac00e5676f"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.36.1 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
