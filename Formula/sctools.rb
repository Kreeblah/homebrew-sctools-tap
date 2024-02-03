class Sctools < Formula
  desc "Tools for Soarer's Converter"
  homepage "https://github.com/Kreeblah/sctools_macos"
  url "https://github.com/Kreeblah/sctools_macos/archive/v1.14.3.tar.gz"
  sha256 "fada780cae674c4cca1a55f923aecd7df83ccf61a4fde71981d5b6b1ef5d29eb"

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
