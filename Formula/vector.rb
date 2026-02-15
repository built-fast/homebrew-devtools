class Vector < Formula
  version "0.2.2"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "9446e9ed25982a35921c8dc5b7a97725cda4fc8195f21ed57b83efed333e29ee"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "021eb84c9ed5b14803dd3bf9a9ade70ef0ec32e8a79d807c5ce3e15636f89adc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3dc09cb7587eefad5cc30bddc14ead80e975e42a29cd496997cd2cd8bc85407"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0b4470c2d700205859d222de0a2c606085dd5d0af296b66dfe5d95aa1a121e3"
    end
  end

  def install
    bin.install "vector"
    man1.install "man/man1/vector.1"
  end

  test do
    assert_match "vector #{version}", shell_output("#{bin}/vector --version")
  end
end
