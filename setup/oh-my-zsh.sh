#!/bin/bash
# Shared: install oh-my-zsh if not already present

set -e

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "==> oh-my-zsh already installed"
else
  echo "==> Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "==> oh-my-zsh installed"
fi

# Improve performance in large repos
git config --global oh-my-zsh.hide-dirty 1
git config --global oh-my-zsh.hide-status 0
