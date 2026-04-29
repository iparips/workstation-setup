#!/bin/bash
# Ubuntu/Debian-specific tool installation via apt + curl

set -e

echo "==> [Ubuntu] Setting up tools..."

# Update package cache
echo "==> Updating package cache..."
sudo apt-get update -q

# Install base packages via apt
echo "==> Installing apt packages..."
sudo apt-get install -y \
  git \
  zsh \
  curl \
  ripgrep \
  jq \
  bat

# Install starship prompt into ~/.local/bin (no sudo needed)
if ! command -v starship &>/dev/null; then
  echo "==> Installing starship..."
  mkdir -p "$HOME/.local/bin"
  curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir "$HOME/.local/bin"
else
  echo "==> starship already installed"
fi

# Install zsh-abbr v5 from GitHub (no Homebrew tap available on Linux)
ZSH_ABBR_DIR="$HOME/.zsh-abbr"
if [ -d "$ZSH_ABBR_DIR" ]; then
  current_tag=$(cd "$ZSH_ABBR_DIR" && git describe --tags 2>/dev/null || echo "unknown")
  if [[ "$current_tag" == v5* ]]; then
    echo "==> zsh-abbr $current_tag already installed"
  else
    echo "==> Found zsh-abbr $current_tag, replacing with v5..."
    rm -rf "$ZSH_ABBR_DIR"
  fi
fi

if [ ! -d "$ZSH_ABBR_DIR" ]; then
  echo "==> Installing zsh-abbr v5..."
  git clone --branch v5 --single-branch https://github.com/olets/zsh-abbr.git "$ZSH_ABBR_DIR"
  echo "==> zsh-abbr $(cd "$ZSH_ABBR_DIR" && git describe --tags) installed"
fi

# Install z (directory jumper) as a single-file script
if [ ! -f "$HOME/.z.sh" ]; then
  echo "==> Installing z..."
  curl -fsSL https://raw.githubusercontent.com/rupa/z/master/z.sh -o "$HOME/.z.sh"
  echo "==> z installed"
else
  echo "==> z already installed"
fi

# Install fnm (Fast Node Manager) - optional, skip if not wanted
# Uncomment to enable:
# if ! command -v fnm &>/dev/null; then
#   echo "==> Installing fnm..."
#   curl -fsSL https://fnm.vercel.app/install | bash
# fi

echo "==> [Ubuntu] Tool installation complete"
