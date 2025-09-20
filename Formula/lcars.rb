class Lcars < Formula
  version "0.2.3"

  desc     "Laravel CLI and Reusable Scripts"
  homepage "https://github.com/built-fast/lcars"
  url      "https://github.com/built-fast/lcars/archive/v#{version}.tar.gz"
  sha256   "eb6376f8602fd86a5eccaf82d4e423377bc7cadbfc89fe8744183b0f90fab406"

  head "https://github.com/built-fast/lcars.git", branch: "main"

  def install
    zsh_completion.install "completions/_lcars" => "_lcars"
    prefix.install ["bin", "completions", "libexec", "vendor"]
    man1.install "share/man/man1/lcars.1"
    share.install "share/lcars"
  end
end
