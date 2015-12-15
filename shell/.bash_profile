source ~/.bashrc

# Mac Specific Conifg

GPG_TTY=`tty`
export GPG_TTY

## Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.git-completion.bash

# Withenv
source /usr/local/opt/withenv/withenv.bash

## Ssh Private Key Add
ssh-add

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin
export PATH=$PATH:/Users/iparipsa/.lein

## commonly used dirs
alias rea='cd ~/BOK/Code/REA'

# postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

## java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home/"
export PATH=$JAVA_HOME/bin:$PATH

# z
. `brew --prefix`/etc/profile.d/z.sh

## json
alias pj='pbpaste | jsonpp | less'

# aws
export AWS_CLI=/usr/local/bin/aws
source /usr/local/opt/saml-aws-functions/bash-functions

# haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# docker
alias dm='docker-machine'
