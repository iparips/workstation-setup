export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"

eval "$(fnm env --use-on-cd --shell zsh)"

# Work specific configs
source $HOME/.workrc

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.volta/bin:$PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Z
. /opt/homebrew/etc/profile.d/z.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Git

source /opt/homebrew/share/zsh/site-functions
