#!/bin/bash
# Dotfiles installer for m4max

set -e
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES"

# Ghostty
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -sf "$DOTFILES/.config/ghostty/config" ~/Library/Application\ Support/com.mitchellh.ghostty/config

# Zed
mkdir -p ~/.config/zed
ln -sf "$DOTFILES/.config/zed/settings.json" ~/.config/zed/settings.json
ln -sf "$DOTFILES/.config/zed/keymap.json" ~/.config/zed/keymap.json

# Kitty
mkdir -p ~/.config/kitty
ln -sf "$DOTFILES/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# Fish
mkdir -p ~/.config/fish
ln -sf "$DOTFILES/.config/fish/config.fish" ~/.config/fish/config.fish

# GitHub CLI
mkdir -p ~/.config/gh
ln -sf "$DOTFILES/.config/gh/config.yml" ~/.config/gh/config.yml

# Git
ln -sf "$DOTFILES/.gitconfig" ~/.gitconfig
mkdir -p ~/.git-hooks
ln -sf "$DOTFILES/.git-hooks/commit-msg" ~/.git-hooks/commit-msg
chmod +x ~/.git-hooks/commit-msg

# Zsh
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/.zprofile" ~/.zprofile
ln -sf "$DOTFILES/.zshenv" ~/.zshenv

echo "Done! Configure git user settings and run 'gh auth login'"
