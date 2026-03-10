class Vector < Formula
  version "0.4.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "a286decf19803997abc8d6c841ba0c7858da698c3136de732ffcee51fb47a7fc"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "9a9a105c9787d618724a98a23795b45a2177887d404ea9738eedab3be0face07"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "156c961c95bc49be9999b4e39bb2c7ba93fe05162a71821f90690bc59db3bd10"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90afa1c4800ed511c1cb1949d931b1bdadefb7664463ba2e0e151d73777368af"
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
