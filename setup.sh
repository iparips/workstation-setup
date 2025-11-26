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
  starship \
  sublime-merge sublime-text rectangle \
  busycal \

# Install Nerd Font for starship icons
brew install --cask font-meslo-lg-nerd-font

# Link zshrc and starship config
ln -F -s $(pwd)/shell/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -F -s $(pwd)/shell/starship.toml ~/.config/starship.toml
source ~/.zshrc
