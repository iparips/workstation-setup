#!/bin/bash
# macOS-specific tool installation via Homebrew

set -e

echo "==> [macOS] Setting up tools..."

# Detect or install Homebrew
if command -v brew &>/dev/null; then
  echo "==> Homebrew already installed"
  homebrew_prefix="$(brew --prefix)"
else
  if [ "$(uname -m)" = "arm64" ]; then
    homebrew_prefix=/opt/homebrew
  else
    homebrew_prefix=/usr/local
  fi

  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$($homebrew_prefix/bin/brew shellenv)"
fi

export HOMEBREW_PREFIX="$homebrew_prefix"

# Install CLI tools
echo "==> Installing CLI tools..."
brew install git \
  z fnm \
  olets/tap/zsh-abbr \
  ripgrep jq bat \
  starship
echo "==> CLI tools installed"

# Install GUI applications (casks) if not already present
echo "==> Checking GUI applications..."
for cask in sublime-merge sublime-text rectangle font-meslo-lg-nerd-font; do
  case "$cask" in
    sublime-merge)        app_name="Sublime Merge.app" ;;
    sublime-text)         app_name="Sublime Text.app" ;;
    rectangle)            app_name="Rectangle.app" ;;
    font-meslo-lg-nerd-font) app_name="" ;;
  esac

  if [ -z "$app_name" ] || [ ! -d "/Applications/$app_name" ]; then
    if ! brew list --cask "$cask" &>/dev/null; then
      echo "==> Installing cask: $cask"
      brew install --cask "$cask"
    fi
  fi
done
echo "==> GUI applications checked"
