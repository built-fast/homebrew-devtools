class Php83Stack < Formula
  desc "Meta package for BuiltFast PHP development"
  homepage "https://github.com/built-fast/homebrew-devtools"

  url "https://raw.githubusercontent.com/built-fast/homebrew-devtools/refs/heads/main/Formula/php83-stack.rb"
  version "HEAD"

  option "with-redis", "Install Redis server"
  option "with-mysql", "Install MySQL server"

  depends_on "composer"
  depends_on "curl"
  depends_on "direnv"
  depends_on "fzf"
  depends_on "gh"
  depends_on "git"
  depends_on "jq"
  depends_on "mysql" if build.with? "mysql"
  depends_on "node"
  depends_on "redis" if build.with? "redis"
  depends_on "ripgrep"
  depends_on "shellcheck"
  depends_on "shivammathur/extensions/redis@8.3"
  depends_on "shivammathur/php/php@8.3"
  depends_on "wp-cli"

  def install
    # Create a simple info file
    (prefix/"info").write "Meta package for PHP development stack"
  end

  def caveats
    <<~EOS
      Additional GUI applications can be installed with:
        brew install --cask 1password-cli
    EOS
  end

  test do
    system "git", "--version"
    system "php", "--version"
    system "composer", "--version"
  end
end
