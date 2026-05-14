#!/usr/bin/env bash

# eton-zshrc bootstrap script
# This script installs the necessary dependencies and environment for the Zsh configuration.

set -e

echo "🚀 Starting Zsh & WezTerm environment installation..."

############################################
# 1. Install System Dependencies
############################################
echo "📦 Installing system packages..."
sudo apt update
sudo apt install -y zsh git curl wget unzip fonts-powerline

# Check for WezTerm
if ! command -v wezterm &> /dev/null; then
    echo "⚠️ WezTerm not found. Please install it from: https://wezfurlong.org/wezterm/install/linux.html"
fi

############################################
# 2. Setup ZDOTDIR in ~/.zshenv
############################################
if [ ! -f "$HOME/.zshenv" ] || ! grep -q "ZDOTDIR" "$HOME/.zshenv"; then
    echo 'export ZDOTDIR=$HOME/.config/zsh' >> "$HOME/.zshenv"
    echo "✅ ZDOTDIR set in ~/.zshenv"
fi

############################################
# 3. Install Oh My Zsh
############################################
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🚀 Installing Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

############################################
# 4. Install Plugins & Theme
############################################
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

echo "🛠️ Installing Powerlevel10k and Plugins..."

# Powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Auto-suggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

############################################
# 5. Install Nerd Font (JetBrainsMono)
############################################
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
    echo "✅ Font installed"
fi

############################################
# 6. Configure WezTerm (High Contrast)
############################################
echo "🎨 Configuring WezTerm with high contrast settings..."
WEZ_CONFIG_DIR="$HOME/.config/wezterm"
mkdir -p "$WEZ_CONFIG_DIR"

cat > "$WEZ_CONFIG_DIR/wezterm.lua" <<EOF
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- --- Appearance ---
config.window_background_opacity = 0.95
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }
config.hide_tab_bar_if_only_one_tab = true

-- --- Font ---
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

-- --- High Contrast Colors ---
config.colors = {
    foreground = "#FFFFFF",
    background = "#000000",
    cursor_bg = "#FFFFFF",
    cursor_fg = "#000000",
    ansi = { "#000000", "#FF5555", "#50FA7B", "#F1FA8C", "#BD93F9", "#FF79C6", "#8BE9FD", "#BFBFBF" },
    brights = { "#999999", "#FF6E6E", "#69FF94", "#FFFFA5", "#D6ACFF", "#FF92DF", "#A4FFFF", "#FFFFFF" },
}

-- --- Behavior ---
config.default_prog = { "/usr/bin/zsh", "--login" }
config.scrollback_lines = 10000

-- --- Keybindings ---
config.keys = {
    { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
}

return config
EOF

############################################
# 7. Set Zsh as Default Shell
############################################
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🐚 Setting Zsh as default shell..."
    chsh -s $(which zsh)
fi

echo ""
echo "✨ WezTerm & Zsh environment installation complete!"
echo "🔄 Please log out and log back in, or restart your computer."
