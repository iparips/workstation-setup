## Simplify Prompt for Cursor

if [ "$TERM_PROGRAM" = "vscode" ] || [ "$TERM_PROGRAM" = "Cursor" ]; then
  # Disable fancy prompt
  unset POWERLEVEL9K_CONFIG
  PROMPT='%n@%m:%~%# '
  RPROMPT=''
  # Disable instant prompt
  # source lines for instant prompt commented out
else

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  export ZSH_DISABLE_COMPFIX="true"
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_THEME="powerlevel10k/powerlevel10k"

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  plugins=(git)
  source $ZSH/oh-my-zsh.sh

fi

source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

# setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH

  autoload -Uz compinit
  compinit
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"

export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/python@3.12/libexec/bin:$PATH

## openssl
export PATH="/usr/local/opt/openssl@3.4/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
export DYLD_LIBRARY_PATH="/usr/local/opt/openssl@3/lib:$DYLD_LIBRARY_PATH"

# Work specific configs
source $HOME/.workrc

# Z
. /opt/homebrew/etc/profile.d/z.sh

## Git
source /opt/homebrew/share/zsh/site-functions

# Fast node manager
eval "$(fnm env --use-on-cd --shell zsh)"