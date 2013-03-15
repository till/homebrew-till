require 'formula'

class Nano < Formula
  homepage 'http://www.nano-editor.org/'
  url 'http://www.nano-editor.org/dist/v2.3/nano-2.3.1.tar.gz'
  sha1 'bd1993189f82649b4960b1ccd7142a61f43f2993'

  #depends_on "s-lang"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--enable-color"
    args << "--enable-nanorc"
    args << "--sysconfdir=#{etc}"
    args << "--enable-extra"
    args << "--enable-justify"
    args << "--enable-multibuffer"
    args << "--enable-utf8"
	args << "--disable-nls"
    #args << "--with-slang=#{HOMEBREW_PREFIX}"

    system "./configure", *args
    system "make clean"
    system "make install"
  end
end
