# Homebrew DevTools

A Homebrew tap providing development tools and meta-packages for PHP development.

## Installation

```bash
brew tap built-fast/devtools
brew install php83-stack
```

## Available Formulas

### php83-stack

Meta package that installs a complete PHP 8.3 development stack including:

- **PHP & Extensions**: PHP 8.3 with Redis extension
- **Development Tools**: Composer, WP-CLI, Node.js
- **Shell Tools**: direnv, fzf, ripgrep, shellcheck, jq
- **Version Control**: Git, GitHub CLI
- **Optional Services**: MySQL and Redis servers

#### Options

- `--with-mysql`: Install MySQL server
- `--with-redis`: Install Redis server

#### Usage

```bash
# Basic installation
brew install php83-stack

# With optional services
brew install php83-stack --with-mysql --with-redis
```

## License

MIT License - see [`LICENSE`](./LICENSE) for details.
