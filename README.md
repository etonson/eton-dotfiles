# eton-dotfiles

My unified professional development environment configuration.

## 🗺️ Project Map

```text
~/dotfiles/
├── zsh/                # 所有 Zsh 相關 (原本的 eton-zshrc)
│   ├── .zshrc          # 主要設定檔
│   ├── .p10k.zsh       # Powerlevel10k 提示字元風格設定
│   └── README.md
├── wezterm/            # 所有 WezTerm 相關 (原本的 eton-wezterm)
│   ├── wezterm.lua     # WezTerm 功能與配色設定
│   └── README.md
├── scripts/            # 跨工具的安裝與檢查腳本
│   └── bootstrap.sh    # 一鍵安裝所有東西的總入口
├── .zshenv             # 放在 $HOME 的引導檔 (指向 ~/dotfiles/zsh)
├── README.md           # 整個環境的總體說明
└── .gitignore
```

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
