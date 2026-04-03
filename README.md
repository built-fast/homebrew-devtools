# BuiltFast Homebrew DevTools

A Homebrew tap providing tools for BuiltFast users and developers.

## Installation

```bash
brew tap built-fast/devtools
```

## Available Formulas

### LCARS

Laravel CLI and Reusable Scripts, a collection of tools and scripts to enhance
Laravel development.

#### Usage

```bash
brew install built-fast/devtools/php83-stack
```

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

### recurly-cli

Command-line interface for the [Recurly](https://recurly.com) v3 API.

#### Usage

```bash
brew install built-fast/devtools/recurly-cli

recurly configure

# Table (default), JSON, or pretty JSON
recurly accounts list
recurly accounts list --output json
recurly accounts list --output json-pretty

# Select specific fields
recurly accounts list --field id,code,email

# Built-in jq filtering (no external jq needed)
recurly subscriptions list --jq '.data[] | select(.state == "active") | .id'
```

## License

MIT License - see [`LICENSE`](./LICENSE) for details.
