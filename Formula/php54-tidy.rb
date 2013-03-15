require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Tidy < AbstractPhp54Extension
  init
  url 'http://www.php.net/get/php-5.4.12.tar.bz2/from/this/mirror'
  sha1 '9e1af30b763ba3de19b68b9b8abde1aae1e5e630'
  version '5.4.12'

  head 'https://svn.php.net/repository/php/php-src/trunk', :using => :svn

  depends_on 'php54'
  depends_on 'homebrew/dupes/tidy'

  def install
    Dir.chdir "ext/tidy" do
      safe_phpize
      system "./configure"
      system "make"
      prefix.install "modules/tidy.so"
    end
  end

end