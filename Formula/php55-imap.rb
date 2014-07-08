require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Imap < AbstractPhp54Extension

  init
  include AbstractPhpVersion::Php55Defs

  url     PHP_SRC_TARBALL
  sha256  PHP_CHECKSUM[:sha256]
  version PHP_VERSION
  head    PHP_GITHUB_URL, :branch => PHP_BRANCH

  depends_on 'php55'
  #depends_on 'homebrew/dupes/tidy'

  def install
    Dir.chdir "ext/imap" do
      safe_phpize
      system "./configure"
      system "make"
      prefix.install "modules/imap.so"
      write_config_file unless build.include? "without-config-file"
    end
  end

end
