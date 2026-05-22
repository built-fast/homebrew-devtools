class Vector < Formula
  version "0.9.2"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_arm64.tar.gz"
      sha256 "509d4cb9306370edad042265abf5cffbe3f806dd38cad7bf0b54894069127ef5"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_amd64.tar.gz"
      sha256 "932c5652be0542093a7655d4e19eef46af1a40f1575c896ec322a6bf067d3326"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_arm64.tar.gz"
      sha256 "7897406afbbd5a807104b298376784fe16694c3529dc9b65841ef9849dd88ca4"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_amd64.tar.gz"
      sha256 "c022380defcc9d4ab7dbd4096d58c60e98444fd3f9f46e944e0d3cca4dccbf50"
    end
  end

  def install
    bin.install "vector"
    man1.install "share/man/man1/vector.1"
    generate_completions_from_executable(bin/"vector", "completion")
  end

  test do
    assert_match "vector #{version}", shell_output("#{bin}/vector --version")
  end
end
