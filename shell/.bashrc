# Prompt
source ~/.prompt

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
chruby 2.1.2