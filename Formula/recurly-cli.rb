class RecurlyCli < Formula
  version "0.0.1"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "a38e938e9d0f0f7afe60e31b5ad0b8c5d2c7fbf6a6a86652076d74fdef575da5"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "38c6be78a9f4e11c08d06c7307c79d2ae1a102de256936317cd4672ee93aa756"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "bc2eefa894fbf507c148a4316b5e43e5cd457d32a7b10eb8a47ba90d79d48903"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "feed64aa65f71ae551cd99a9fd69267e71b8929f8e521e5be0c2589cbce1f6da"
    end
  end

  def install
    bin.install "recurly"
    man1.install "man/man1/recurly.1"
    generate_completions_from_executable(bin/"recurly", "completion")
  end

  test do
    assert_match "recurly-cli v#{version}", shell_output("#{bin}/recurly --version")
  end
end
