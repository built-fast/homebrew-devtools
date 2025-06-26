class Lcars < Formula
  version "0.0.1"

  homepage "https://github.com/built-fast/lcars"
  url      "https://github.com/built-fast/lcars/archive/v#{version}.tar.gz"
  sha256   "fixme"

  head "https://github.com/built-fast/lcars.git"

  def install
    bin.install "bin/lcars"
    # man1.install "share/man/man1/lcars.1"
  end
end
