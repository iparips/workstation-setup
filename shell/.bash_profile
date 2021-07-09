set +e

# this skips history for commands starting with a space
export HISTCONTROL=ignorespace

## Volta
export VOLTA_HOME=$HOME/.volta

## PATH
export PATH=$VOLTA_HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin

## Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

export EDITOR='vi'

# z
source $(brew --prefix)/etc/profile.d/z.sh

# Git Log Format
export GLF="--pretty=format:%m %C(yellow)%h %C(red)%ad %C(blue)%an%C(green)%d %C(reset)%s"

alias g='git status'
alias ga='git add -A'
alias gc='git commit'
alias gp='git pull --rebase'
alias gsp='git stash && git pull --rebase && git stash pop'
alias glg="git log --graph \"$GLF\" --date=default"
alias gl="git log \"$GLF\" --date=default"
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))'"
alias glc="git log --oneline --graph --left-right --cherry-pick \"$GLF\" --date=default"

## java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/"
export PATH=$PATH:$JAVA_HOME/bin


# adds private key identities to the authentication agent
ssh-add

source ~/.prompt
