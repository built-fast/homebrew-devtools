class BunnyCli < Formula
  version "0.0.0"

  desc "Unofficial Bunny.net CLI"
  homepage "https://github.com/built-fast/bunny-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "FIXME"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "FIXME"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_arm64.tar.gz"
      sha256 "FIXME"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_amd64.tar.gz"
      sha256 "FIXME"
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
