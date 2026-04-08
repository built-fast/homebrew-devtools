class BunnyCli < Formula
  version "0.0.1"

  desc "Unofficial Bunny.net CLI"
  homepage "https://github.com/built-fast/bunny-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "4cb39e551a990b698ba9afca55c28e2d6d3bc51c7950ba06bd337165335f3e1b"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "d47ed76bb84d41034756c55e576b3bcf74382a8169d9626d23530d33a2634bbc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_arm64.tar.gz"
      sha256 "2f3cac122e5f6a0f2e70d5a01d55e07f2ba9190bf37aa35b9e258496fa5c334b"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_amd64.tar.gz"
      sha256 "cf4ff2705c83d55cdc3068858aa1f48ae76f4b0e24f4b79239d0cd88297300c0"
    end
  end

  def install
    bin.install "bunny"
    man1.install "share/man/man1/bunny.1"
    generate_completions_from_executable(bin/"bunny", "completion")
  end

  test do
    assert_match "bunny-cli v#{version}", shell_output("#{bin}/bunny --version")
  end
end
