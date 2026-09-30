class Ard < Formula
  desc "Programming language and compiler"
  homepage "https://github.com/akonwi/ard"
  version "0.43.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/akonwi/ard/releases/download/v0.43.0/ard_v0.43.0_darwin_arm64.tar.gz"
      sha256 "e6180c7db5ad0790c69930a7c217d01da8490f9acb695269aa8ac696522ae77c"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.43.0/ard_v0.43.0_darwin_amd64.tar.gz"
      sha256 "9efc182fd060ee3639908ea178c438283f9a58e833aed52a4b87d5358384b9a9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/akonwi/ard/releases/download/v0.43.0/ard_v0.43.0_linux_arm64.tar.gz"
      sha256 "df477bbb9291033f48a3cb764e0d803253b20a22f1829a74e9a558db3aff0c9f"
    else
      url "https://github.com/akonwi/ard/releases/download/v0.43.0/ard_v0.43.0_linux_amd64.tar.gz"
      sha256 "d7dac751f44b257afca153f2fcd8feaa15c5e2883122f4e3078c078af73791f5"
    end
  end

  def install
    bin.install "ard"
  end

  test do
    assert_match "v0.43.0", shell_output("#{bin}/ard version")
  end
end
