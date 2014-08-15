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

# Install git
brew install git

# Install ruby
if [ ! -d "${ruby_dir}" ]; then
  brew install chruby
  brew install ruby-install

  ## Install ruby pre-requisites
  brew install openssl readline libyaml gdbm libffi
  ruby-install ruby # installs latest stable ruby
fi

# Install z
brew install z

# Link bash_profile & prompt
ln -F -s ${setup_root}/shell/.bash_profile ~/.bash_profile
ln -F -s ${setup_root}/shell/.prompt ~/.prompt
source ~/.bash_profile

# Install withenv
rm -rf ${setup_root}/tmp
mkdir ${setup_root}/tmp

if [ ! -d "${tools_dir}/withenv-master" ]; then

  if [ ! -d "${tools_dir}" ]; then
    mkdir ${tools_dir}
  fi

  git clone git@github.com:mdub/withenv.git ${setup_root}/tmp/withenv-master
  mv -f ${setup_root}/tmp/withenv-master /usr/local/tools/

fi

# Cleanup
rm -rf ${setup_root}/tmp
