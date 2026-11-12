#!/usr/bin/env bash
# Sets up a new Mac from this repo. Safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

info() { printf '\n\033[1;34m==> %s\033[0m\n' "$1"; }

# Symlink $1 (in repo) to $2, moving any existing file out of the way first.
link() {
    local src="$DOTFILES/$1" dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "ok      $dest"
        return
    fi
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
        echo "backup  $dest -> $BACKUP_DIR/"
    fi
    ln -s "$src" "$dest"
    echo "linked  $dest -> $src"
}

info "Xcode command line tools"
if ! xcode-select -p >/dev/null 2>&1; then
    xcode-select --install
    echo "Finish the Xcode tools installer, then run this script again."
    exit 1
fi

info "Homebrew"
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

info "Brewfile packages, fonts and apps"
brew bundle --file="$DOTFILES/Brewfile"

info "oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
for plugin in zsh-syntax-highlighting zsh-autosuggestions; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        git clone --depth 1 "https://github.com/zsh-users/$plugin" "$ZSH_CUSTOM/plugins/$plugin"
    fi
done

info "nvm and Node LTS"
if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    PROFILE=/dev/null bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh)"
fi
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm alias default 'lts/*'

info "Linking config files"
link zsh/.zshrc        "$HOME/.zshrc"
link zsh/.zprofile     "$HOME/.zprofile"
link zsh/aliases.zsh   "$ZSH_CUSTOM/aliases.zsh"
link git/ignore        "$HOME/.config/git/ignore"
link nvim              "$HOME/.config/nvim"

info "Done"
cat <<'EOF'
Next:
  1. Open iTerm2 and set the font to VictorMono Nerd Font
     (Cmd , -> Profiles -> Text).
  2. Run `nvim`, ignore the first-run errors, quit, then run `nvim` again
     and do :PackerSync.
  3. Set your git name and email (see README).
EOF
