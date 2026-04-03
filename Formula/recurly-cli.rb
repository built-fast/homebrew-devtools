class RecurlyCli < Formula
  version "0.0.2"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "3bd94d3a92269841b67f9da75a3fbd89b738dada1147e95c5e789c008e6c057d"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "bf8905c983f1fb3479bf4a91d191113e2c7ab3ce235389f15460cc2f123bb7d7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "20139b6b73a8c913c88374f0e0edcbd983d5f3f63cd24bbbc9820387ef1ab64a"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "3c93c752b6c20cdeb70694b64ca53acef1c252df304884808a7fe636ab662881"
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
