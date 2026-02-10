#!/bin/bash
set -e # break on error

echo "==> Git Abbreviations Setup (Linux - No Homebrew)"
echo "==> This script sets up git abbreviations using zsh-abbr without Homebrew"
echo ""

# Check if zsh is installed
if ! command -v zsh &>/dev/null; then
  echo "ERROR: zsh is not installed. Please install it first:"
  echo "  sudo apt install zsh -y"
  exit 1
fi

# Install oh-my-zsh if not present (required for git helper functions)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "==> oh-my-zsh installed"
else
  echo "==> oh-my-zsh already installed"
fi

# Install zsh-abbr v5 from GitHub (v5 works standalone without job-queue dependency)
ZSH_ABBR_DIR="$HOME/.zsh-abbr"
REQUIRED_VERSION="v5"
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
  echo "==> Installing zsh-abbr v5 from GitHub..."
  git clone --branch v5 --single-branch https://github.com/olets/zsh-abbr.git "$ZSH_ABBR_DIR"
  echo "==> zsh-abbr $(cd "$ZSH_ABBR_DIR" && git describe --tags) installed"
fi

# Create or update .zshrc with necessary configurations
echo "==> Configuring .zshrc..."

# Backup existing .zshrc if it exists and wasn't created by us or oh-my-zsh install
if [ -f "$HOME/.zshrc" ]; then
  if ! grep -q "oh-my-zsh" "$HOME/.zshrc" 2>/dev/null; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
    echo "==> Backed up existing .zshrc"
  fi
fi

# Create .zshrc with git abbreviations support
cat > "$HOME/.zshrc" << 'EOF'
# Oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Load zsh-abbr AFTER oh-my-zsh so space expansion works
source "$HOME/.zsh-abbr/zsh-abbr.zsh"

# Work-specific configs (if present)
[ -f "$HOME/.workrc" ] && source "$HOME/.workrc"
EOF

echo "==> .zshrc configured"

# Setup git abbreviations
echo "==> Setting up git abbreviations..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GIT_ALIASES_FILE="$SCRIPT_DIR/shell/git-aliases.zsh"

# Check if git-aliases.zsh exists
if [ ! -f "$GIT_ALIASES_FILE" ]; then
  echo "ERROR: Could not find git-aliases.zsh at $GIT_ALIASES_FILE"
  echo "Please run this script from the workstation-setup directory"
  exit 1
fi

# Load git abbreviations
zsh -c "
  source $HOME/.zsh-abbr/zsh-abbr.zsh
  source $HOME/.oh-my-zsh/oh-my-zsh.sh

  # Erase all existing user abbreviations
  for abbr_name in \$(abbr list-abbreviations 2>/dev/null); do
    abbr erase \$abbr_name 2>/dev/null
  done

  # Load git abbreviations from file
  source $GIT_ALIASES_FILE
  echo 'Git abbreviations loaded successfully'
"

echo ""
echo "==> Setup complete!"
echo ""
echo "To start using git abbreviations:"
echo "  1. Start a new zsh shell: zsh"
echo "  2. Or source your .zshrc: source ~/.zshrc"
echo ""
echo "Examples:"
echo "  g      → git status"
echo "  gco    → git checkout"
echo "  gpl    → git pull --rebase"
echo "  gp     → git push"
echo ""
echo "Type an abbreviation and press SPACE to expand it."
echo "See shell/git-aliases.zsh for the full list."
