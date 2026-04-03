class RecurlyCli < Formula
  version "0.0.4"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "cba781174404f0e59f377158c43e52c221187ec5a08b965cfd78f933c50ae134"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "19041add8e9f14ed4b1e73ea33d428baaa2a9f7345962e22d22470bc9fc9ea37"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "3b8ccf45be836cc623b6e84a4d78e18db58e36340d7ac11a2ce7746a95db0311"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "7f1caadceb352d6fc2f87a3ab5d60c106560cf6c01032cb1c6af20b8971c1335"
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
