# Work
source ~/.zshrc_work

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.localaliases" ]] && source "$HOME/.localaliases"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
source /opt/homebrew/share/zsh/site-functions

# this skips history for commands starting with a space
export HISTCONTROL=ignorespace

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

## Editor Setup
export EDITOR='vi'
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH=$PATH:/Users/iparipsa/bin

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
alias yp="yarn precommit"

setopt NO_NOMATCH # makes git checkout HEAD^ work again

## java
export JAVA_HOME=$(/usr/libexec/java_home -v "11")
export PATH=$PATH:$JAVA_HOME/bin

## node
export PATH=$PATH:/usr/local/lib/node_modules/bin
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# adds private key identities to the authentication agent
ssh-add



# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
