class Vector < Formula
  version "0.2.1"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "ba943f43abdec7cf80e7f665d0a968bfe8f10dc424c1f4756ccf27e5c5660746"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "b3a150f9b73adb83742b347abcf59c377c482aadb72e21f2ce7bae97938a6bec"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01265753048c7715eae3c2c9f19a40fc5f43b8d55e37fc7b8e809d97087a81f8"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "323d7faf476249a362792441f009363f525bcb930a1a6ef329aa7c1ce99c50cf"
    end
  end

  def install
    bin.install "vector"
  end

  test do
    assert_match "vector #{version}", shell_output("#{bin}/vector --version")
  end
end
