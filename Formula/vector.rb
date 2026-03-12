class Vector < Formula
  version "0.6.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "cfef94946fdc1d50eb7cbf7243981140577f0cd62bad26b6bef5faedea6366ef"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "c219452f7194fd0419a4f7058d8ab7a3917c2b48d9c0bfcb5b9a1dcd431ea8b8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5acc5bae45a5c9256f29eae11b5fd5f7229235326ae9ebff7fd636b0e287fd6f"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33a3f13230a226c20fc0b63a131de31364f0aa43cd4ab9c2bee1c5a62714d07b"
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
