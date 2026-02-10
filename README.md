# workstation-setup

Cross-platform development environment setup for macOS and Ubuntu Linux.

## Quick Start

### Full Setup (macOS & Ubuntu with Homebrew)

```bash
git clone <your-repo-url>
cd workstation-setup
./setup.sh
```

This installs:
- Homebrew (if not present)
- CLI tools (git, zsh-abbr, starship, fnm, z, etc.)
- oh-my-zsh
- Git abbreviations with auto-expansion
- Starship shell prompt
- GUI apps (macOS only)

### Git Abbreviations Only (Linux/Devbox - No Homebrew)

For containerized environments like devbox where Homebrew isn't available:

```bash
git clone <your-repo-url>
cd workstation-setup
./setup-git-abbr-linux.sh
```

This lightweight script:
- Installs oh-my-zsh (for git helper functions)
- Installs zsh-abbr from GitHub
- Sets up git abbreviations with auto-expansion
- Creates a minimal `.zshrc`

**Prerequisites**: `zsh` must be installed
```bash
sudo apt install zsh git curl -y
```

## Git Abbreviations

Git commands use auto-expanding abbreviations via `zsh-abbr`. Type the abbreviation and press `Space` to expand it.

Examples:
- `g` → `git status`
- `gco` → `git checkout`
- `gcb` → `git checkout -b`
- `gpl` → `git pull --rebase`
- `gp` → `git push`
- `gc` → `git commit --verbose`
- `gd` → `git diff`
- `glg` → `git log --graph --pretty=...`

See `shell/git-aliases.zsh` for the full list of 100+ abbreviations.

## Supported Platforms

- **macOS** (Apple Silicon & Intel)
- **Ubuntu Linux** (and other Debian-based distros)
- **Devbox / Containers** (use `setup-git-abbr-linux.sh`)

# Shell Prompt

Using [Starship](https://starship.rs/) for a minimal, fast shell prompt. Configuration is in `shell/starship.toml`.

## Terminal Font Configuration

### macOS (iTerm2)

After running `setup.sh`, configure iTerm to use the Meslo Nerd Font:

1. Open iTerm2 → Preferences (⌘,)
2. Go to **Profiles** → **Text**
3. Click **Change Font** under "Font"
4. Select **MesloLGS NF** (any variant like Regular, Bold, etc.)
5. Recommended size: 13-14pt

Favourite iTerm themes:
- Monokai remastered
- Nocturnal Winter (bluish)
- Gruvbox Dark (brownish)

### Ubuntu/Linux

Install a Nerd Font manually for terminal icons:

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
fc-cache -fv
```

Then configure your terminal emulator to use "MesloLGS NF" font.
