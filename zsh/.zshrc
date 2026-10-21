# 修復 Terminal 色彩與連打問題
if [[ -t 0 ]]; then
  # 優先確保使用 256 色，除非在特定終端（如 Alacritty）中
  if [[ "$ALACRITTY_WINDOW_ID" != "" ]]; then
    export TERM=alacritty
  else
    export TERM=xterm-256color
  fi
  stty icrnl
fi

# 高對比 LS_COLORS (參考 Terminator_zsh設定.md)
export LS_COLORS="di=1;34:fi=0:ln=1;36:pi=40;33:so=1;35:bd=40;33;01:cd=40;33;01:ex=1;32"

# 修復 Wayland 環境下 Alacritty 的 Enter/Backspace 連打問題
export WINIT_UNIX_BACKEND=x11
export XMODIFIERS="@im=none"

# Keep user tools and locally installed commands available after moving dotfiles.
typeset -U path PATH
path=("$HOME/.local/bin" /usr/local/bin $path)
export PATH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#if [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f87ff"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

export EDITOR=nano

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'

(( $+commands[quiet-dev] )) && alias qd='quiet-dev'
(( $+commands[focus-build] )) && alias fb='focus-build'
(( $+commands[full-power] )) && alias fp='full-power'
(( $+commands[system-default] )) && alias sd='system-default'

alias ss='flameshot gui'

# nvim
alias vim='nvim'
alias v='nvim'

autoload -Uz compinit
compinit

[[ ! -f "${ZDOTDIR:-${${(%):-%x}:A:h}}/.p10k.zsh" ]] || source "${ZDOTDIR:-${${(%):-%x}:A:h}}/.p10k.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Maven
export MAVEN_HOME=/opt/apache-maven-3.9.12
[[ ! -d "$MAVEN_HOME/bin" ]] || path=("$MAVEN_HOME/bin" $path)
export EDITOR=nvim
export VISUAL=nvim

# bun
export BUN_INSTALL="${BUN_INSTALL:-$HOME/.bun}"
[[ ! -d "$BUN_INSTALL/bin" ]] || path=("$BUN_INSTALL/bin" $path)

# bun completions
[[ ! -s "$BUN_INSTALL/_bun" ]] || source "$BUN_INSTALL/_bun"
