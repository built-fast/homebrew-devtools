class RecurlyCli < Formula
  version "0.0.1"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "FIXME"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "FIXME"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "FIXME"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "FIXME"
    end
  end

  def install
    bin.install "recurly"
    # man1.install "man/man1/recurly.1"
    generate_completions_from_executable(bin/"recurly", "completion")
  end

  test do
    assert_match "recurly-cli v#{version}", shell_output("#{bin}/recurly --version")
  end
end
