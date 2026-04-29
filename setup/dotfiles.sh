#!/bin/bash
# Shared: link or copy dotfiles into $HOME
# On macOS: uses symlinks (so edits in the repo are reflected immediately)
# On Linux: uses symlinks too, assuming the repo is cloned to a stable location

set -e

# When sourced, use the caller's SCRIPT_DIR; when executed directly, derive it
if [ -z "$SCRIPT_DIR" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
fi

echo "==> Linking dotfiles..."

# .zshrc
ln -sfn "$SCRIPT_DIR/shell/.zshrc" "$HOME/.zshrc"
echo "==>   ✓ ~/.zshrc"

# starship config
mkdir -p "$HOME/.config"
ln -sfn "$SCRIPT_DIR/shell/starship.toml" "$HOME/.config/starship.toml"
echo "==>   ✓ ~/.config/starship.toml"

# git-aliases (available as a standalone file for manual re-sourcing if needed)
ln -sfn "$SCRIPT_DIR/shell/git-aliases.zsh" "$HOME/.git-aliases.zsh"
echo "==>   ✓ ~/.git-aliases.zsh"

echo "==> Dotfiles linked"
