class Sctools < Formula
  desc "Tools for Soarer's Converter"
  homepage "https://github.com/Kreeblah/sctools_macos"
  url "https://github.com/Kreeblah/sctools_macos/archive/v1.10.1.tar.gz"
  sha256 "eca1455f45290ecadf42ff589921cb79e332675073db06ba24659e09bedc8280"

  def install
    Dir.chdir("build/macosx")
    system "make"
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