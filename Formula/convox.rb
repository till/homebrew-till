require "language/go"

class Convox < Formula
  desc "Compile convox on your system"
  homepage "https://github.com/convox/rack"
  url "https://github.com/convox/rack/archive/20170115210753.tar.gz"
  sha256 "e9e28924ecbe21f476910cc54cf301add455c1fef6533282121e68fe9595b379"

  head "https://github.com/convox/rack.git"

  depends_on "go" => :build


	def install
    ENV['GOPATH'] = buildpath
    system "go", "get", "./cmd/convox"

    bin.install "#{ENV['GOPATH']}/bin/convox"
  end

  test do
    output = shell_output(bin/"convox -v")
    assert_match "client: dev", output
  end
end
