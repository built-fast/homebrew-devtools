class Vector < Formula
  version "0.8.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "b923c91134cff9e5e5bcfa55b22ba4f98f6f27824826d246851ae4c3226e7548"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "6cbbd0abe29f92ab2c081ff7c6ea3c0d98d0b1a8e96b5810cdbdeaa1e00a52d0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2853a67f13bbd4c88c10cdfc3d2476a485012dff9ce32da10de6d1df06fb02fb"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa12bbfa7e1fbf810be86cad5c5726bf9d6a25229ea05009961cc8343a330b18"
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
