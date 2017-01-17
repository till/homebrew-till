require "language/go"

class Convox < Formula
  desc "Compile convox on your system"
  homepage "https://github.com/convox/rack"
  url "https://github.com/convox/rack/archive/20170115210753.tar.gz"
  sha256 "3db5f261483b87330743e16b340a2f76349e2dcca6b1dd85b9e1b1288d50af22"

  head "https://github.com/convox/rack.git"

  depends_on "go" => :build

  def install
		system "go", "get", "github.com/convox/rack/..."

    bin.install "convox"
  end

  test do
    output = shell_output(bin/"convox -v")
    assert_match "client: dev", output
  end
end
