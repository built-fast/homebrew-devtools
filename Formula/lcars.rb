class Lcars < Formula
  version "0.1.2"

  homepage "https://github.com/built-fast/lcars"
  url      "https://github.com/built-fast/lcars/archive/v#{version}.tar.gz"
  sha256   "3ee30e5b4f47656dbcdb2b7e70dd19141ce4ab5422e7f03f849ad970642ab780"

  head "https://github.com/built-fast/lcars.git", branch: "main"

  def install
    zsh_completion.install "completions/_lcars" => "_lcars"
    prefix.install ["bin", "completions", "libexec", "vendor"]
    man1.install "share/man/man1/lcars.1"
    share.install "share/lcars"
  end
end
