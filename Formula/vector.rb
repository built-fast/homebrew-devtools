class Vector < Formula
  version "0.9.1"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_arm64.tar.gz"
      sha256 "1a90a3e739dcb96ad6a29390b31b4ff9c96fc30e28f4378612e70435085d82b8"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_amd64.tar.gz"
      sha256 "df1625bc15e3b11de9e9a8f6c11227e779b03e378e8a912c808f1a6ff7181fe1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_arm64.tar.gz"
      sha256 "3732bbd4e41d89466b2c731a9cb001241fb0fc619e61bbcba7a09aafaf3d8310"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_amd64.tar.gz"
      sha256 "3191defa0cf5a7a01ddfbcdf63ca55bdde2a1d71dd293fe5a89fe3b744e44968"
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
