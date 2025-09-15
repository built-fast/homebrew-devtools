class Lcars < Formula
  version "0.2.2"

  homepage "https://github.com/built-fast/lcars"
  url      "https://github.com/built-fast/lcars/archive/v#{version}.tar.gz"
  sha256   "d5d86c94e7e95728fd9a8e899d518d966e680a26cfae15c7b6e1ea78a25d0e98"

  head "https://github.com/built-fast/lcars.git", branch: "main"

  def install
    zsh_completion.install "completions/_lcars" => "_lcars"
    prefix.install ["bin", "completions", "libexec", "vendor"]
    man1.install "share/man/man1/lcars.1"
    share.install "share/lcars"
  end
end
