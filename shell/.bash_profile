# this skips history for commands starting with a space
export HISTCONTROL=ignorespace

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin
export PATH=$PATH:/usr/local/tools/rea-slip-utils/bin

## Bash Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

export EDITOR='vi'

# z
. `brew --prefix`/etc/profile.d/z.sh

## commonly used dirs
alias rea='cd ~/Code/REA'

# git

# Git Bash Prompt
# if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
#   GIT_PROMPT_THEME=Default
#   source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
# fi

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

## ruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

alias b='bundle'
alias be='bundle exec'

# node
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export NODE_PATH="`npm root -g`":$NODE_PATH
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# aws
export AWS_CLI=/usr/local/bin/aws
export AWS_DEFAULT_REGION=ap-southeast-2

# authenticate config
export IDP_USER=iparipsa
export IDP_HOST=idp.realestate.com.au

# docker
alias dc='docker-compose'
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# fuck command
eval "$(thefuck --alias)"
alias f='fuck'

# adds private key identities to the authentication agent
ssh-add
