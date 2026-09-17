# ── Claude Code session marker ───────────────────────
# Claude Code exports CLAUDE_CODE_CHILD_SESSION into the shells it spawns, so
# a session started from inside one writes no transcript. An interactive shell
# reached by opening a tab is not that nested session, and iTerm2 hands a
# restored tab the environment it was born with, so the marker outlives the
# agent that set it and silently disables transcript saving for every later
# run of claude in that tab.
[[ -o interactive ]] && unset CLAUDE_CODE_CHILD_SESSION

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
