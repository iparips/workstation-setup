# ── Homebrew (macOS only) ────────────────────────────
if [[ "$OSTYPE" == darwin* ]]; then
  if [[ -d /opt/homebrew ]]; then
    export OPT_HOMEBREW=/opt/homebrew
  else
    export OPT_HOMEBREW=/usr/local
  fi
  eval "$($OPT_HOMEBREW/bin/brew shellenv)"
fi

# ── PATH ─────────────────────────────────────────────
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
if [[ -n "$OPT_HOMEBREW" ]]; then
  export PATH="$OPT_HOMEBREW/bin:$OPT_HOMEBREW/sbin:$PATH"
  # Sublime Text (macOS only)
  export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
  # Python (Jmake-managed, macOS only)
  export PATH="$OPT_HOMEBREW/opt/python@3.12/libexec/bin:$PATH"
fi

# ── Oh-My-Zsh ────────────────────────────────────────
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ── zsh-abbr (source AFTER oh-my-zsh) ───────────────
if [[ -n "$OPT_HOMEBREW" ]] && [[ -f "$OPT_HOMEBREW/share/zsh-abbr/zsh-abbr.zsh" ]]; then
  # macOS via Homebrew
  FPATH="$(brew --prefix)/share/zsh-abbr:$FPATH"
  autoload -Uz compinit && compinit
  source "$OPT_HOMEBREW/share/zsh-abbr/zsh-abbr.zsh"
elif [[ -f "$HOME/.zsh-abbr/zsh-abbr.zsh" ]]; then
  # Linux (cloned from GitHub)
  FPATH="$HOME/.zsh-abbr:$FPATH"
  autoload -Uz compinit && compinit
  source "$HOME/.zsh-abbr/zsh-abbr.zsh"
fi

# ── Starship prompt ──────────────────────────────────
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# ── Z (directory jumper) ─────────────────────────────
if [[ -f "$OPT_HOMEBREW/etc/profile.d/z.sh" ]]; then
  . "$OPT_HOMEBREW/etc/profile.d/z.sh"
elif [[ -f "$HOME/.z.sh" ]]; then
  . "$HOME/.z.sh"
fi

# ── fnm (Node version manager) ───────────────────────
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# ── Docker CLI completions ───────────────────────────
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
  autoload -Uz compinit && compinit
fi

# ── Work-specific config ─────────────────────────────
[[ -f "$HOME/.workrc" ]] && source "$HOME/.workrc"
