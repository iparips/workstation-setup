# this skips history for commands starting with a space
export HISTCONTROL=ignorespace

# load nab settings
source ~/.nabrc

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin

## Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

export EDITOR='subl'

# z
. `brew --prefix`/etc/profile.d/z.sh

source ~/.prompt

alias g='git status'
alias ga='git add -A'
alias gc='git commit'
alias gd='git diff'
alias gp='git pull --rebase'
alias gsp='git stash && git pull --rebase && git stash pop'
alias gl="git log --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gb="git branch --sort=-committerdate"

## java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/"
export PATH=$JAVA_HOME/bin:$PATH

# node
export NVM_DIR="$HOME/.nvm"
source ~/Tools/homebrew/opt/nvm/nvm.sh

export NODE_PATH="`npm root -g`":$NODE_PATH
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# docker
alias dc='docker-compose'

# adds private key identities to the authentication agent
ssh-add

