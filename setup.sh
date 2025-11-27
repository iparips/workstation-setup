#!/bin/sh
set -e # break on error

# Detect Homebrew - check if already in PATH first
if command -v brew &>/dev/null; then
  echo "==> Homebrew already installed"
  homebrew_prefix="$(brew --prefix)"
  brew_executable="${homebrew_prefix}/bin/brew"
else
  # Determine where to install based on architecture
  # Apple Silicon (arm64) uses /opt/homebrew, Intel (x86_64) uses /usr/local
  if [ "$(uname -m)" = "arm64" ]; then
    homebrew_prefix=/opt/homebrew
  else
    homebrew_prefix=/usr/local
  fi
  brew_executable=${homebrew_prefix}/bin/brew

  # Install homebrew
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(${brew_executable} shellenv)"
fi

# Install CLI tools
echo "==> Installing CLI tools..."
brew install git \
  z fnm \
  olets/tap/zsh-abbr \
  ag jq \
  starship
echo "==> CLI tools installed"

# Install GUI applications (casks) if they are not already installed
echo "==> Checking GUI applications..."
for cask in sublime-merge sublime-text rectangle font-meslo-lg-nerd-font; do
  echo "==> Checking cask: $cask"
  # Map cask names to their app bundle names
  case "$cask" in
    sublime-merge) app_name="Sublime Merge.app" ;;
    sublime-text) app_name="Sublime Text.app" ;;
    rectangle) app_name="Rectangle.app" ;;
    font-meslo-lg-nerd-font) app_name="" ;;  # Fonts don't create .app bundles
  esac

  # If it's a font or the app doesn't exist, check if brew has it installed
  if [ -z "$app_name" ] || [ ! -d "/Applications/$app_name" ]; then
    if ! brew list --cask $cask &>/dev/null; then
      echo "==> Installing cask: $cask"
      brew install --cask $cask
    fi
  fi
done

# Link zshrc
ln -sfn $(pwd)/shell/.zshrc ~/.zshrc

# Link starship config (shell prompt enhancer)
mkdir -p ~/.config
ln -sfn $(pwd)/shell/starship.toml ~/.config/starship.toml

# Setup git abbreviations
# Erase all existing user abbreviations and re-import from git aliases file
# This ensures abbreviations are always up-to-date with the aliases file
echo "Setting up git abbreviations..."

zsh -c "
  source ${homebrew_prefix}/share/zsh-abbr/zsh-abbr.zsh

  # Erase all existing user abbreviations
  for abbr_name in \$(abbr list-abbreviations); do
    abbr erase \$abbr_name 2>/dev/null
  done

  # Load git abbreviations from file
  source $(pwd)/shell/git-aliases.zsh
  echo 'Git abbreviations loaded successfully'
"

# Source zshrc if running in zsh
if [ -n "$ZSH_VERSION" ]; then
  source ~/.zshrc
fi
