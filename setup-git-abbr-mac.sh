#!/bin/zsh
# Don't use set -e when sourcing, as it will exit the shell on any error

echo "==> Setting up Git Abbreviations (macOS)"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GIT_ALIASES_FILE="$SCRIPT_DIR/shell/git-aliases.zsh"

# Check if git-aliases.zsh exists
if [ ! -f "$GIT_ALIASES_FILE" ]; then
  echo "ERROR: Could not find git-aliases.zsh at $GIT_ALIASES_FILE"
  echo "Please run this script from the workstation-setup directory"
  exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "ERROR: Homebrew is not installed"
  echo "Please install Homebrew first: https://brew.sh"
  exit 1
fi

# Check if zsh-abbr is installed via Homebrew
ZSH_ABBR_ZSH="$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh"
if [ ! -f "$ZSH_ABBR_ZSH" ]; then
  echo "ERROR: zsh-abbr is not installed"
  echo "Please install zsh-abbr first:"
  echo "  brew install olets/tap/zsh-abbr"
  exit 1
fi

# Check if oh-my-zsh is installed (required for git helper functions)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "WARNING: oh-my-zsh not found at $HOME/.oh-my-zsh"
  echo "Some abbreviations that use git_current_branch / git_main_branch may not work correctly"
  echo ""
fi

echo "==> Setting up git abbreviations..."
echo ""

# Load git abbreviations in a clean zsh subshell so that:
#   1. zsh-abbr and oh-my-zsh are sourced in the correct order
#   2. Abbreviations are written to the persistent user storage (not just the current session)
#   3. The erase + reload cycle is atomic and doesn't affect the calling shell
zsh -c "
  # Load oh-my-zsh git plugin so git_current_branch / git_main_branch etc. are defined
  if [ -f \"\$HOME/.oh-my-zsh/oh-my-zsh.sh\" ]; then
    source \"\$HOME/.oh-my-zsh/oh-my-zsh.sh\"
  fi

  # Load zsh-abbr
  source '$ZSH_ABBR_ZSH'

  echo '==> Erasing existing git abbreviations...'

  # Erase all existing user abbreviations (persistent store)
  for abbr_name in \$(abbr list-abbreviations 2>/dev/null | sed 's/=.*//'); do
    abbr erase \"\$abbr_name\" 2>/dev/null
  done

  echo '==> Loading git abbreviations from file...'

  # Load git abbreviations from file (adds to persistent user store)
  source '$GIT_ALIASES_FILE'

  echo ''
  echo '==> Verification'
  loaded_count=\$(abbr list-abbreviations 2>/dev/null | wc -l | tr -d ' ')
  echo \"  ✓ Successfully loaded \$loaded_count git abbreviation(s)\"
  echo ''
  echo '  Loaded abbreviations (first 20):'
  abbr list-abbreviations 2>/dev/null | head -20 | sed 's/^/    /'
  if [ \"\$loaded_count\" -gt 20 ]; then
    remaining=\$((loaded_count - 20))
    echo \"    ... and \$remaining more\"
  fi
"

echo ""
echo "==> Setup complete!"
echo ""
echo "To start using git abbreviations, open a new terminal or run:"
echo "  source ~/.zshrc"
echo ""
echo "Examples:"
echo "  g      → git status"
echo "  gco    → git checkout"
echo "  gpl    → git pull --rebase"
echo "  gri    → git rebase -i \$(git merge-base origin/ci/cached-master HEAD) --autosquash"
echo ""
echo "Type an abbreviation and press SPACE to expand it."
echo "See shell/git-aliases.zsh for the full list."
