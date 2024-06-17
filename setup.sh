#!/bin/sh

set -e # -x # break on error, verbose

brew_executable=/usr/local/bin/brew

# Install homebrew
if [ ! -f "${brew_executable}" ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew update
fi

brew install git \
  z nvm \
  olets/tap/zsh-abbr \
  ag jq \
  htop \
  romkatv/powerlevel10k/powerlevel10k \
  sublime-merge sublime-text rectangle \
  busycal \


# Link zshrc & p10k config
ln -F -s $(pwd)/shell/.zshrc ~/.zshrc
ln -F -s $(pwd)/shell/.p10k.zsh ~/.p10k.zsh
source ~/.zshrc
