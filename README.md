# eton-dotfiles

My unified professional development environment configuration.

## 📂 Structure

- `zsh/`: Zsh configuration (Powerlevel10k, plugins, and custom functions like `extract-commit`).
- `wezterm/`: WezTerm configuration with high-contrast Dracula theme.
- `scripts/`: System bootstrap and automation scripts.

## 🚀 Quick Start (New Machine)

```bash
# 1. Clone to home directory
git clone git@github.com:etonson/eton-dotfiles.git ~/dotfiles

# 2. Run the bootstrap script
cd ~/dotfiles
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
```

## ✨ Key Features

- **XDG Compliant**: Configs are symlinked to `~/.config/` but managed centrally in `~/dotfiles`.
- **Zsh**: Integrated with `extract-commit` function and Git alias.
- **WezTerm**: High-contrast professional theme.
- **Automated**: One script handles fonts, plugins, and system packages.
