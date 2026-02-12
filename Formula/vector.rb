class Vector < Formula
  version "0.2.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "bdd35dc5a86da8cf08de7a97dd2ed6b604bb6f0bcbda862a2c3f3eb18acf1eaf"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "e83b9ee9e7afeca34ea95a94e3867fa8830a9bb0b1dee75a98aed41d6031d05b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1dffa27614bda06c3be43c135185471edfec2d9fcb0fbd3e2c45217351c296b6"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "745025c47e67ae48adf82560281f52fb50ef63356b3c4a97ee476afe394f2a7b"
    end
  end

  def install
    bin.install "vector"
  end

  test do
    assert_match "vector #{version}", shell_output("#{bin}/vector --version")
  end
end
