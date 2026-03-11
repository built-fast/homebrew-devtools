class Vector < Formula
  version "0.5.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-apple-darwin.tar.gz"
      sha256 "8823ddc0df855f33032f31f2c8d75006318783bd83f98626a1a6cd0142455712"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-apple-darwin.tar.gz"
      sha256 "c86f67f48d466d0725c993fbd140e7990cb49e54a74d3f3abcd584b35d9f0eb4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b318567feba06e909576f5c0c0ffb30329584b6bb8af339d2af6a24a01380016"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fe9dc513042b02ca42605ffb68bb372b6f74c3d3d680f49f58cb86ebf89012e"
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
