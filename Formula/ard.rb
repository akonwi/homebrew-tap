class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.24.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.24.0/ard_v0.24.0_darwin_arm64.tar.gz"
      sha256 "8aadbb5bcd6bd00c7a322724c98452c2257e750c6ecc2ded26c9661b7ae2cbda"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.24.0/ard_v0.24.0_darwin_amd64.tar.gz"
      sha256 "cfe45d13a41331bb7b26cf17b9a0564fbd9335a3f27ae8171c0465eba6a7328b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.24.0/ard_v0.24.0_linux_arm64.tar.gz"
      sha256 "0ce53977b60bb865b50caf1a200db4e4f269e424b6eb525058299516ff873d57"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.24.0/ard_v0.24.0_linux_amd64.tar.gz"
      sha256 "76b953d50abc000921962c2b6ed80a7755862e370131461e8500ac8fef19c951"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.24.0", shell_output("#{bin}/ard version")
  end
end
