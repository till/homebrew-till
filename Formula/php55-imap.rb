require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Imap < AbstractPhp55Extension

  init
  include AbstractPhpVersion::Php55Defs

  url     PHP_SRC_TARBALL
  sha256  PHP_CHECKSUM[:sha256]
  version PHP_VERSION
  head    PHP_GITHUB_URL, :branch => PHP_BRANCH

  depends_on 'imap-uw'
  depends_on 'php55'

  def install
    Dir.chdir "ext/imap" do
      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig,
                            "--disable-dependency-tracking",
      system "make"
      prefix.install "modules/imap.so"
      write_config_file unless build.include? "without-config-file"
    end
  end

end
