# this skips history for commands starting with a space
export HISTCONTROL=ignorespace

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin

## Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

export EDITOR='vi'

# z
. `brew --prefix`/etc/profile.d/z.sh

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

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# adds private key identities to the authentication agent
ssh-add
