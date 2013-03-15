require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Tidy < AbstractPhp54Extension
  init
  url 'http://www.php.net/get/php-5.4.11.tar.bz2/from/this/mirror'
  sha1 '85666f32bf1f2850c769fe58fed788ae8fdfa1cb'
  version '5.4.11'

  head 'https://svn.php.net/repository/php/php-src/trunk', :using => :svn

  depends_on 'php54'
  depends_on 'dupes/tidy'

  def install
    Dir.chdir "ext/tidy" do
      args = "--with-tidy=#{Formula.factory('tidy').prefix},shared"
      args << " --prefix=#{prefix}"
      args << " --with-homebrew-openssl" if MacOS.version == :leopard

      safe_phpize
      system "./configure", args
      system "make"
      prefix.install "modules/tidy.so"
    end
  end

end