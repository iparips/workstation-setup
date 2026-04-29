#!/bin/bash
# Workstation setup entry point
# Detects the OS and delegates to the appropriate platform installer,
# then runs shared setup steps (oh-my-zsh, dotfiles, git abbreviations).

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "================================================"
echo " Workstation Setup"
echo "================================================"
echo ""

# ── Detect OS ────────────────────────────────────────
OS="$(uname -s)"
case "$OS" in
  Darwin)
    echo "==> Detected: macOS"
    source "$SCRIPT_DIR/platforms/mac.sh"
    ;;
  Linux)
    # Distinguish distros via /etc/os-release
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      case "$ID" in
        ubuntu|debian|linuxmint|pop)
          echo "==> Detected: Ubuntu/Debian"
          source "$SCRIPT_DIR/platforms/ubuntu.sh"
          ;;
        *)
          echo "ERROR: Unsupported Linux distro: $ID"
          echo "Add a platforms/${ID}.sh and extend this case statement."
          exit 1
          ;;
      esac
    else
      echo "ERROR: Cannot detect Linux distro (no /etc/os-release)"
      exit 1
    fi
    ;;
  *)
    echo "ERROR: Unsupported OS: $OS"
    exit 1
    ;;
esac

echo ""

# ── Shared setup steps ───────────────────────────────
source "$SCRIPT_DIR/setup/oh-my-zsh.sh"
echo ""

source "$SCRIPT_DIR/setup/dotfiles.sh"
echo ""

source "$SCRIPT_DIR/setup/zsh-abbr.sh"
echo ""

# ── Change default shell to zsh if needed ───────────
if [ "$(basename "$SHELL")" != "zsh" ]; then
  ZSH_PATH="$(which zsh)"
  if [ -n "$ZSH_PATH" ] && [ -x "$ZSH_PATH" ]; then
    echo "==> Changing default shell to zsh..."
    # Use sudo chsh on Linux (Ubuntu requires it); on macOS chsh prompts for password
    if [ "$OS" = "Linux" ]; then
      sudo chsh -s "$ZSH_PATH" "$(whoami)"
    else
      chsh -s "$ZSH_PATH"
    fi
    echo "==> ✓ Default shell changed to zsh ($ZSH_PATH)"
  else
    echo "==> ⚠ zsh not found — skipping shell change"
  fi
else
  echo "==> ✓ Already using zsh"
fi

echo ""
echo "================================================"
echo " ✓ Setup complete!"
echo "================================================"
echo ""
echo "Open a new terminal (or run: exec zsh) to start using your shell."
