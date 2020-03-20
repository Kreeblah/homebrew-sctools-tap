class Sctools < Formula
  desc "Tools for Soarer's Converter"
  homepage "https://github.com/Kreeblah/sctools_macos"
  url "https://github.com/Kreeblah/sctools_macos/archive/v1.10.tar.gz"
  sha256 "917f1bc06bacadbbbab6cc970fdbd3fcfe668d6127c53ee36fdc3e3b529aa7d8"

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