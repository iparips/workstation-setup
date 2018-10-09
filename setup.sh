#!/bin/sh

set -e # -x # break on error, verbose

setup_root=`pwd`
tools_dir=/usr/local/tools
brew_executable=/usr/local/bin/brew
ruby_dir=~/.rubies/ruby-2.1.2

# Install homebrew
if [ ! -f "${brew_executable}" ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew update
fi

brew install git \
 z nvm chruby thefuck \
 bash-git-prompt ag jq \
 bash-completion

# Install ruby
if [ ! -d "${ruby_dir}" ]; then
  brew install chruby
  brew install ruby-install

  ## Install ruby pre-requisites
  brew install openssl readline libyaml gdbm libffi
  ruby-install ruby # installs latest stable ruby
fi

# Link bash_profile & prompt
ln -F -s ${setup_root}/shell/.bash_profile ~/.bash_profile
ln -F -s ${setup_root}/shell/.prompt ~/.prompt
source ~/.bash_profile

# Cleanup
rm -rf ${setup_root}/tmp
