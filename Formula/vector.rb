class Vector < Formula
  version "0.1.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "b17f1a6e1f6b0d425006923e39e7132975cc6599b0dc6c3f9792759967dc9b56"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "8fa718c7aef68d4630dac8c2c2f3804d633aa37542da09a3972a967218755d95"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "461adc4247512b47c3e4ca0ae13d454128f600cca1bd188814be79ee395c3b1e"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f00f60a71028d97f679ec90ab9b7c529eee5dc20cdd9726f0062fe7c086004a4"
    end
  end

  def install
    bin.install "vector"
  end

  test do
    assert_match "vector #{version}", shell_output("#{bin}/vector --version")
  end
end
