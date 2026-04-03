class RecurlyCli < Formula
  version "0.0.3"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "375a504d69c446032d79283fc68b608c940339ac085332ce05990c3afce5ff41"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "1ba6c36a903eb2b7df7202f152c02e5a944a6d11108ad145d7184f458b8a613e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "98df6d0d2a71c81c6bdf5f2b892034493ce3bd513f03b4e48f228e63f7f2cd1e"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "2b2e044a1a1d91a34ea34a59585f1780ea49e417348d08d04b8de187e6f06fb5"
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
