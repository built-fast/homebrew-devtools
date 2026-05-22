class RecurlyCli < Formula
  version "0.0.6"

  desc "Unofficial Recurly CLI"
  homepage "https://github.com/built-fast/recurly-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "f6c39eb46e015638a7421296341194e47ee90cbee698403cc32ba7c23a12f41a"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "eeda0b26ad7ecc6588e3a68d83eac85d8162cd9a594aa4635d383152c53d25ff"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_arm64.tar.gz"
      sha256 "221f4bea6a1252bf6f5f95d8c8e25edd407b802298072fe8e813b99b465975f8"
    else
      url "https://github.com/built-fast/recurly-cli/releases/download/v#{version}/recurly-cli_#{version}_linux_amd64.tar.gz"
      sha256 "d06555d8a80f2769701de151313a4051fff30d3ca6749b72d6d1ee16f9a66019"
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
