# Prompt
source ~/.prompt

# Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Withenv
source /usr/local/tools/withenv-master/withenv.bash

# Ssh Private Key Add
ssh-add

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin
export PATH=$PATH:/Users/iparipsa/.lein

GPG_TTY=`tty`
export GPG_TTY

# commonly used dirs
alias rea='cd ~/BOK/Code/REA'

# git
alias g='git status'
alias ga='git add -A'
alias gc='git commit'
alias gd='git diff'
alias gp='git pull --rebase'
alias gsp='git stash && git pull --rebase && git stash pop'

# ruby
alias b='bundle'
alias be='bundle exec'
alias m='mine .'

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.1.2

# postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# rea-ec2
alias rssh=rea-ec2-ssh
alias rli=rea-ec2-list-instances

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

# z
. `brew --prefix`/Cellar/z/1.8/etc/profile.d/z.sh

# json
alias pj='pbpaste | jsonpp | less'
