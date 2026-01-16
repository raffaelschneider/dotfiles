#!/bin/bash
# Shared dotfiles installer

set -e
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing shared dotfiles from $DOTFILES"

# Git config
if [ -f "$DOTFILES/.gitconfig" ]; then
    echo "  Linking .gitconfig..."
    ln -sf "$DOTFILES/.gitconfig" ~/.gitconfig
fi

# Git hooks
if [ -d "$DOTFILES/.git-hooks" ]; then
    echo "  Linking .git-hooks..."
    ln -sf "$DOTFILES/.git-hooks" ~/.git-hooks
    chmod +x ~/.git-hooks/*
fi

echo ""
echo "Done!"
echo ""
echo "Set your signing key:"
echo "  git config --global user.signingkey ~/.ssh/YOUR_KEY.pub"
