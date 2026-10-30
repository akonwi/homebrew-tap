class Kit < Formula
  desc "Terminal-first coding agent"
  homepage "https://github.com/akonwi/kit"
  license "MIT"

  depends_on macos: :sonoma if OS.mac?

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/kit/releases/download/v0.53.0/kit_v0.53.0_darwin_arm64.tar.gz"
      sha256 "9fbf4c667a7b14fef8d377aa0c3bbbb086927b50775d7a26f532f0f59b255d88"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.53.0/kit_v0.53.0_darwin_amd64.tar.gz"
      sha256 "bb280ff640df7e0b718f12e434d4d1df96df100fcb92e3d6dbdc6edc136d5aa3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/kit/releases/download/v0.53.0/kit_v0.53.0_linux_arm64.tar.gz"
      sha256 "7ebbf17dac94d8e8c7ce7d72fe4dfe2bace44efb7032f8d14c8dc6e7412839f2"
    else
      url "https://github.com/akonwi/kit/releases/download/v0.53.0/kit_v0.53.0_linux_amd64.tar.gz"
      sha256 "99793b670acc3340fe1370016788e86a8b77189bdf64ba668f21c3ddecc4ec0e"
    end
  end

  def install
    bin.install "kit"
  end

  test do
    assert_match "kit 0.53.0 (", shell_output("#{bin}/kit version")
    assert_match "Manage the local Kit server", shell_output("#{bin}/kit server --help")
  end
end
