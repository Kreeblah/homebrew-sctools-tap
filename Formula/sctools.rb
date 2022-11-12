class Sctools < Formula
  desc "Tools for Soarer's Converter"
  homepage "https://github.com/Kreeblah/sctools_macos"
  url "https://github.com/Kreeblah/sctools_macos/archive/v1.14.2.tar.gz"
  sha256 "5af48cbbe03a3b77c1e5f00c47085e7624c96329f5279868e0af35fe7d5a89cd"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    Dir.chdir("build/macosx")
    system "make", "ARCH=#{arch}"
    bin.install "../../bin/scas"
    bin.install "../../bin/scboot"
    bin.install "../../bin/scdis"
    bin.install "../../bin/scinfo"
    bin.install "../../bin/scrd"
    bin.install "../../bin/scwr"
  end

  test do
    assert_match "usage", shell_output("${bin}/scas")
    assert_match "looking for", shell_output("${bin}/scboot")
    assert_match "usage", shell_output("${bin}/scdis")
    assert_match "looking for", shell_output("${bin}/scinfo")
    assert_match "usage", shell_output("${bin}/scrd")
    assert_match "usage", shell_output("${bin}/scwr")
  end
end
