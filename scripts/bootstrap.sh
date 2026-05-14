#!/usr/bin/env bash

# eton-dotfiles bootstrap script
set -e

DOTFILES=$HOME/.dotfiles

echo "🚀 Starting eton-dotfiles bootstrap..."

# 1. System Dependencies
echo "📦 Installing system packages..."
sudo apt update
sudo apt install -y zsh git curl wget unzip fonts-powerline

# 2. XDG Setup & Symlinks
echo "🔗 Setting up symbolic links..."
mkdir -p ~/.config

# Zsh
echo "🔗 Linking Zsh config..."
rm -rf ~/.config/zsh
ln -s "$DOTFILES/zsh" ~/.config/zsh

# WezTerm
echo "🔗 Linking WezTerm config..."
rm -rf ~/.config/wezterm
ln -s "$DOTFILES/wezterm" ~/.config/wezterm

# ZDOTDIR in ~/.zshenv
if [ ! -f "$HOME/.zshenv" ] || ! grep -q "ZDOTDIR" "$HOME/.zshenv"; then
    echo 'export ZDOTDIR=$HOME/.config/zsh' >> "$HOME/.zshenv"
    echo "✅ ZDOTDIR set in ~/.zshenv"
fi

# 3. Oh My Zsh & Plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10k
[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
# Plugins
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# 4. Fonts
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
if [ ! -f "$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
    echo "🔤 Installing JetBrainsMono Nerd Font..."
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -o JetBrainsMono.zip -d "$FONT_DIR"
    fc-cache -fv
    rm -rf "$TEMP_DIR"
fi

# 5. Set Default Shell
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

echo "✨ Bootstrap complete! Please restart your terminal."
