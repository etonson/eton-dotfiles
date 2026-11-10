# eton-zshrc

My personalized Zsh configuration, organized according to XDG standards.

## Setup

This configuration is designed to live in `~/.config/zsh`. To make Zsh find it, you need to set the `ZDOTDIR` environment variable in your `~/.zshenv`.

### 1. Clone and Install
Clone this repository to `~/.config/zsh` and run the installation script:
```bash
git clone git@github.com:etonson/eton-zshrc.git ~/.config/zsh
cd ~/.config/zsh
chmod +x install.sh
./install.sh
```

The script will:
- Install system dependencies (Zsh, Terminator, etc.)
- Set up `ZDOTDIR` in your `~/.zshenv`
- Install Oh My Zsh and required plugins
- Install JetBrainsMono Nerd Font
- Configure Terminator with the Dracula theme

## Features

### Directory colors

`LS_COLORS` in `.zshrc` uses bold yellow without a background for
other-writable directories (`ow`, such as mode `0777`). Other-writable
directories with the sticky bit (`tw`, such as mode `1777`) use bold magenta;
ordinary directories and sticky-only directories (`st`) use bold blue.

Reload with `source "${ZDOTDIR:-$HOME}/.zshrc"` or open a new terminal.

### Custom Functions

#### `extract-commit`
Extracts files changed in a specific git commit or range to a target directory while preserving the directory structure.

**Usage:**
```bash
# Extract files from a specific commit
extract-commit <commit-hash> <target-directory>

# Extract files from a range of commits
extract-commit <start-hash>..<end-hash> <target-directory>
```

### Git Aliases
This setup works well with the following Git alias (add to your `~/.gitconfig`):
```ini
[alias]
    extract = "!f() { \
        commit=$1; \
        target=$(readlink -f \"$2\"); \
        mkdir -p \"$target\"; \
        git diff-tree --no-commit-id --name-only -r --diff-filter=d \"$commit\" | xargs -I{} cp --parents \"{}\" \"$target\"; \
        echo \"Files from $commit extracted to $target\"; \
    }; f"
```

## Included Plugins
- `git`
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`

## Theme
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
