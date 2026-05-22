class Lcars < Formula
  version "0.2.4"

  desc     "Laravel CLI and Reusable Scripts"
  homepage "https://github.com/built-fast/lcars"
  url      "https://github.com/built-fast/lcars/archive/v#{version}.tar.gz"
  sha256   "9c66839e8483192fc0e7f5af7113910d104f0bf1ebc5b101861c0936e698d905"

  head "https://github.com/built-fast/lcars.git", branch: "main"

  def install
    zsh_completion.install "completions/_lcars" => "_lcars"
    prefix.install ["bin", "completions", "libexec", "vendor"]
    man1.install "share/man/man1/lcars.1"
    share.install "share/lcars"
  end
end
