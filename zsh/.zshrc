# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# zsh-syntax-highlighting and zsh-autosuggestions are cloned into
# $ZSH_CUSTOM/plugins by install.sh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Aliases live in ~/.oh-my-zsh/custom/aliases.zsh (symlinked from this repo's
# zsh/aliases.zsh), which oh-my-zsh loads automatically.

export EDITOR="nvim"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Machine-specific settings and secrets (not committed)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
