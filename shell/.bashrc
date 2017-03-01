# Git Bash Prompt
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

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

## chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.2.3

# node
export NODE_PATH="`npm root -g`":$NODE_PATH
export EDITOR='subl --wait --new-window'
export AWS_DEFAULT_REGION=ap-southeast-2

# bash my aws
for f in ~/.bash-my-aws/lib/*-functions; do source $f; done
source ~/.bash-my-aws/bash_completion.sh

# bash completion for awscli
complete -C aws_completer aws

# bash completion for spring
source /usr/local/etc/bash_completion.d/spring

export NVM_DIR="/Users/ilya.paripsa/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# fuck command
eval "$(thefuck --alias)"
alias f='fuck'

# ssh add
ssh-add

