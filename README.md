# workstation-setup

Cross-platform development environment setup for macOS and Ubuntu Linux.

## Quick Start

```bash
git clone <your-repo-url>
cd workstation-setup
./setup.sh
```

`setup.sh` auto-detects the OS and runs the right platform installer, then applies shared config.

### What gets installed

| Tool | macOS | Ubuntu |
|---|---|---|
| oh-my-zsh | ✓ | ✓ |
| starship (prompt) | ✓ via brew | ✓ via curl |
| zsh-abbr | ✓ via brew | ✓ via git clone |
| z (dir jumper) | ✓ via brew | ✓ via curl |
| ripgrep | ✓ via brew | ✓ via apt |
| jq | ✓ via brew | ✓ via apt |
| bat | ✓ via brew | ✓ via apt |
| fnm (Node) | ✓ via brew | optional (see platforms/ubuntu.sh) |
| Git abbreviations | ✓ | ✓ |
| Sublime Text/Merge | ✓ (cask) | — |
| Rectangle | ✓ (cask) | — |
| Meslo Nerd Font | ✓ (cask) | manual (see below) |

## Structure

```
workstation-setup/
├── setup.sh                  # Entry point — detects OS, orchestrates everything
├── platforms/
│   ├── mac.sh                # macOS: Homebrew + CLI tools + GUI casks
│   └── ubuntu.sh             # Ubuntu/Debian: apt + curl installs
├── setup/
│   ├── oh-my-zsh.sh          # Shared: install oh-my-zsh
│   ├── dotfiles.sh           # Shared: symlink .zshrc, starship.toml, git-aliases
│   └── zsh-abbr.sh           # Shared: load git abbreviations into zsh-abbr store
├── shell/
│   ├── .zshrc                # Portable zsh config (macOS + Linux)
│   ├── git-aliases.zsh       # Git abbreviations (100+ shortcuts)
│   └── starship.toml         # Starship prompt config
├── tool-settings/            # App-specific settings (iTerm, RubyMine, Sublime)
└── diagnose-abbr.sh          # Debug script for zsh-abbr issues
```

### Adding a new platform

1. Create `platforms/<distro>.sh` with the package installs for that distro
2. Add a `case` entry in `setup.sh` matching the distro's `$ID` from `/etc/os-release`

That's it — all shared steps (oh-my-zsh, dotfiles, git abbreviations) run automatically.

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

To reload abbreviations after editing `git-aliases.zsh`:

```bash
source setup/zsh-abbr.sh
```

## Shell Prompt

Using [Starship](https://starship.rs/) for a minimal, fast shell prompt. Config is in `shell/starship.toml`.

## Terminal Font

### macOS (iTerm2)

`setup.sh` installs Meslo Nerd Font via Homebrew cask. Then in iTerm2:

1. Preferences (⌘,) → Profiles → Text → Change Font
2. Select **MesloLGS NF** (13–14pt recommended)

Favourite iTerm themes: Monokai Remastered, Nocturnal Winter, Gruvbox Dark.

### Ubuntu/Linux

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
fc-cache -fv
```

Then set your terminal emulator font to **MesloLGS NF**.
