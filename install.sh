#!/bin/bash
# Dotfiles installer for m1imac

set -e
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing m1imac dotfiles from $DOTFILES"

# Ghostty
if [ -f "$DOTFILES/.config/ghostty/config" ]; then
    echo "  Setting up Ghostty..."
    mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
    ln -sf "$DOTFILES/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
fi

# Zed
if [ -d "$DOTFILES/.config/zed" ]; then
    echo "  Setting up Zed..."
    mkdir -p "$HOME/.config/zed"
    ln -sf "$DOTFILES/.config/zed/settings.json" "$HOME/.config/zed/settings.json"
    ln -sf "$DOTFILES/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json"
fi

# Kitty
if [ -f "$DOTFILES/.config/kitty/kitty.conf" ]; then
    echo "  Setting up Kitty..."
    mkdir -p "$HOME/.config/kitty"
    ln -sf "$DOTFILES/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
fi

# Fish
if [ -f "$DOTFILES/.config/fish/config.fish" ]; then
    echo "  Setting up Fish..."
    mkdir -p "$HOME/.config/fish"
    ln -sf "$DOTFILES/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
fi

# GitHub CLI
if [ -f "$DOTFILES/.config/gh/config.yml" ]; then
    echo "  Setting up GitHub CLI..."
    mkdir -p "$HOME/.config/gh"
    ln -sf "$DOTFILES/.config/gh/config.yml" "$HOME/.config/gh/config.yml"
fi

# Zsh
[ -f "$DOTFILES/.zshrc" ] && echo "  Setting up .zshrc..." && ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES/.zprofile" ] && echo "  Setting up .zprofile..." && ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
[ -f "$DOTFILES/.zshenv" ] && echo "  Setting up .zshenv..." && ln -sf "$DOTFILES/.zshenv" "$HOME/.zshenv"

echo ""
echo "Done!"
echo ""
echo "Next: Install shared configs (.gitconfig, .git-hooks):"
echo "  git clone -b shared https://github.com/raffaelschneider/dotfiles.git ~/dotfiles-shared"
echo "  cd ~/dotfiles-shared && ./install.sh"
echo "  git config --global user.signingkey ~/.ssh/YOUR_KEY.pub"
echo ""
echo "Then authenticate GitHub CLI:"
echo "  gh auth login"
