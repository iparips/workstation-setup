export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

# setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH

  autoload -Uz compinit
  compinit
fi

eval "$(fnm env --use-on-cd --shell zsh)"

# Work specific configs
source $HOME/.workrc

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Z
. /opt/homebrew/etc/profile.d/z.sh

## Git

# Commented out - this was sourcing a directory which may cause issues
# source /opt/homebrew/share/zsh/site-functions

export PATH="/Users/iparipsa/.orbit/bin:$PATH"

# Python Config - auto-configured by Jmake
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/iparipsa/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Initialise Starship Shell Prompt
eval "$(starship init zsh)"