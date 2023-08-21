# Work
source ~/.zshrc_work

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load zsh abbreviations plugin
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

# Git zsh plugin


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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
