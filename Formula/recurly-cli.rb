class RecurlyCli < Formula
  version "0.0.5"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "3a15c822916a319d66d83809bc8b07426f362e5931d56992d4ef921ba76c8f2f"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "57cad2d6758957eef325c9fae9d5e93d53f372cca25841c1e71fc9889f868a5b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "35cde6031247595d21240d68bf79bafd682c11420bc4f370edcafcd884b629b9"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "c6bebff6b18180c5c054ade5c733a984b3aff386af9911afbc53fe8a2aebab3a"
    end
  end

  def install
    bin.install "recurly"
    man1.install "share/man/man1/recurly.1"
    generate_completions_from_executable(bin/"recurly", "completion")
  end

  test do
    assert_match "recurly-cli v#{version}", shell_output("#{bin}/recurly --version")
  end
end
