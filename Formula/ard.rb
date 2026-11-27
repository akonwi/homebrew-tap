class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.49.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.49.1/ard_v0.49.1_darwin_arm64.tar.gz"
      sha256 "a2100aade7617d0f098c0f11d4ceeded070ff525b3068d0394d87010938c5c15"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.49.1/ard_v0.49.1_darwin_amd64.tar.gz"
      sha256 "ea7cd7a0c4857a2eebbc0261cc43f8478f5608f02a30ab2079e86ee419ed3af4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.49.1/ard_v0.49.1_linux_arm64.tar.gz"
      sha256 "3987befaeb8be93e8a043a2966a5ddb1800cdae8ff4ca5136c82bafd5744d8a0"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.49.1/ard_v0.49.1_linux_amd64.tar.gz"
      sha256 "977ad39b55083728f1287d4407c2302293e2bf95810859cccd3d8e4824cfeaa4"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.49.1", shell_output("#{bin}/ard version")
  end
end
