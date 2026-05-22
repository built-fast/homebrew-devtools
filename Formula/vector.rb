class Vector < Formula
  version "0.9.0"

  desc "CLI for Vector Pro hosting platform"
  homepage "https://github.com/built-fast/vector-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_arm64.tar.gz"
      sha256 "756721ec63a08d512cd49c01c71de1478b1f0290db6920936670ace497b2fadf"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_darwin_amd64.tar.gz"
      sha256 "04e8fa072912511b36402798ce0e609cfb10de29738c4235f0412656d50b4300"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_arm64.tar.gz"
      sha256 "3e6c96f67d756dd5bc1cbf541144355fc618ce9da5b65b3ad992811241e11458"
    else
      url "https://github.com/built-fast/vector-cli/releases/download/v#{version}/vector_#{version}_linux_amd64.tar.gz"
      sha256 "aa11f9051306854f1bc2f3c198f360276c27b195e7d07feadbd256d4a309dbcb"
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
