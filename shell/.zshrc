# Setup Homebrew (Apple Silicon vs Intel)
if [[ -d /opt/homebrew ]]; then
  export OPT_HOMEBREW=/opt/homebrew
else
  export OPT_HOMEBREW=/usr/local
fi

eval "$($OPT_HOMEBREW/bin/brew shellenv)"

# Zsh config
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Zsh abbreviated commands - source AFTER oh-my-zsh to preserve key bindings
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH
  autoload -Uz compinit
  compinit
fi

# Load zsh-abbr AFTER oh-my-zsh so space expansion works
source $OPT_HOMEBREW/share/zsh-abbr/zsh-abbr.zsh

# Starship shell prompt
eval "$(starship init zsh)"

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH
export PATH=$OPT_HOMEBREW/bin:$OPT_HOMEBREW/sbin:$PATH

# Z
. $OPT_HOMEBREW/etc/profile.d/z.sh

# Node - Fast node manager
eval "$(fnm env --use-on-cd --shell zsh)"

# Python - auto-configured by Jmake
export PATH="$OPT_HOMEBREW/opt/python@3.12/libexec/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/iparipsa/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Work specific configs
[ -f $HOME/.workrc ] && source $HOME/.workrc
