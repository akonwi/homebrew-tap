class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.21.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.21.1/ard_v0.21.1_darwin_arm64.tar.gz"
      sha256 "5e5fd557def2f352bfffdbb1a0fd9f3eef5c7740c9bb47f51509b2e21557d8f5"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.21.1/ard_v0.21.1_darwin_amd64.tar.gz"
      sha256 "1ecdf4056e0c50d4b8fae4b568bfc2af6bcc0876359129dbca49fdece4b16993"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.21.1/ard_v0.21.1_linux_arm64.tar.gz"
      sha256 "20609a7ea4460a8274f76423ea7cdba65f9ac4730d1e40fd62f7c1740d102209"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.21.1/ard_v0.21.1_linux_amd64.tar.gz"
      sha256 "d46d7152d2a6527ec31065e4ec6cd2fc61686871eecb6a44cc06ee61d967fbcc"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.21.1", shell_output("#{bin}/ard version")
  end
end
