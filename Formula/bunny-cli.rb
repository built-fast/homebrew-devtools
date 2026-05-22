class BunnyCli < Formula
  version "0.0.2"

  desc "Unofficial Bunny.net CLI"
  homepage "https://github.com/built-fast/bunny-cli"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "da4abebc352b23d2db2e32ad919d32dcb7cf43aee9ecb9bb6277e84dcd30c879"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "b2c4fdbc0f76b3676f9b0532a8f4b7780962cf20aa6ea288b875bb8d95a4485a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_arm64.tar.gz"
      sha256 "f8126dd256561b1930e3c68970aab77d9aa142779a9f22de7382c48389e154cb"
    else
      url "https://github.com/built-fast/bunny-cli/releases/download/v#{version}/bunny-cli_#{version}_linux_amd64.tar.gz"
      sha256 "374aa57491f514de3a94897a7604be33a639a507cd4bb86f0c110a8737a0c3a6"
    end
  end

  def install
    bin.install "bunny"
    man1.install "share/man/man1/bunny.1"
    generate_completions_from_executable(bin/"bunny", "completion")
  end

  test do
    assert_match "bunny-cli v#{version}", shell_output("#{bin}/bunny --version")
  end
end
