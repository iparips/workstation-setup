#!/bin/bash
# Shared: load git abbreviations into zsh-abbr persistent store
# Works on both macOS (Homebrew) and Linux (cloned zsh-abbr)

set -e

# When sourced, use the caller's SCRIPT_DIR; when executed directly, derive it
if [ -z "$SCRIPT_DIR" ]; then
  SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
fi
GIT_ALIASES_FILE="$SCRIPT_DIR/shell/git-aliases.zsh"

if [ ! -f "$GIT_ALIASES_FILE" ]; then
  echo "ERROR: Could not find shell/git-aliases.zsh at $GIT_ALIASES_FILE"
  exit 1
fi

# Resolve the zsh-abbr source file - prefer Homebrew, fall back to cloned
if command -v brew &>/dev/null && [ -f "$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh" ]; then
  ZSH_ABBR_ZSH="$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh"
elif [ -f "$HOME/.zsh-abbr/zsh-abbr.zsh" ]; then
  ZSH_ABBR_ZSH="$HOME/.zsh-abbr/zsh-abbr.zsh"
else
  echo "ERROR: zsh-abbr not found. Run the platform setup script first."
  exit 1
fi

echo "==> Loading git abbreviations..."

zsh -c "
  # Load oh-my-zsh so git_current_branch / git_main_branch helpers are available
  if [ -f \"\$HOME/.oh-my-zsh/oh-my-zsh.sh\" ]; then
    source \"\$HOME/.oh-my-zsh/oh-my-zsh.sh\"
  fi

  source '$ZSH_ABBR_ZSH'

  # Erase all existing user abbreviations for a clean reload
  for abbr_name in \$(abbr list-abbreviations 2>/dev/null | sed 's/=.*//'); do
    abbr erase \"\$abbr_name\" 2>/dev/null || true
  done

  source '$GIT_ALIASES_FILE'

  loaded=\$(abbr list-abbreviations 2>/dev/null | wc -l | tr -d ' ')
  echo \"==> ✓ Loaded \$loaded git abbreviation(s)\"
"
