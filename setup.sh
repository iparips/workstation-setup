#!/bin/sh

set -e # -x # break on error, verbose

setup_root=`pwd`

brew install git \
 z nvm \
 bash-git-prompt ag jq \
 bash-completion

# Link bash_profile & prompt
ln -F -s ${setup_root}/shell/.bash_profile ~/.bash_profile
ln -F -s ${setup_root}/shell/.prompt ~/.prompt
source ~/.bash_profile

# Cleanup
rm -rf ${setup_root}/tmp
