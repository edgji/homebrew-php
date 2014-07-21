require 'formula'
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Foreman < Formula
  homepage 'https://github.com/Indatus/blacksmith'
  url 'https://raw.github.com/indatus/blacksmith/v1.1.6/blacksmith.phar'
  sha1 'eb17eb30cd3da6cae3e4b3f47711c47d06e9da99'
  version '1.1.6'

  depends_on PhpMetaRequirement
  depends_on PharRequirement

  def install
    libexec.install "blacksmith.phar"
    sh = libexec + "blacksmith"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/blacksmith.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def test
    system 'blacksmith'
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "blacksmith".

    You can read more about blacksmith by running:
      "brew home blacksmith".
    EOS
  end

end
