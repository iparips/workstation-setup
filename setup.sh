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
  ag jq \
  romkatv/powerlevel10k/powerlevel10k \
  sublime-merge sublime-text sizeup\

# Link bash_profile & prompt
ln -F -s $(pwd)/shell/.zshrc ~/.zshrc
source ~/.zshrc
