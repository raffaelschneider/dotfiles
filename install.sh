#!/bin/bash
# Dotfiles installer
# https://github.com/raffaelschneider/dotfiles

set -e

REPO_URL="https://github.com/raffaelschneider/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════╗"
echo "║         Dotfiles Installer            ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Available device branches
DEVICES=("m4max" "m1max" "x1carbon" "g5zbook")

echo -e "${YELLOW}Available device configurations:${NC}"
echo ""
for i in "${!DEVICES[@]}"; do
    echo "  $((i+1))) ${DEVICES[$i]}"
done
echo ""

# Get user selection
while true; do
    read -p "Select device [1-${#DEVICES[@]}]: " selection
    if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le "${#DEVICES[@]}" ]; then
        DEVICE="${DEVICES[$((selection-1))]}"
        break
    else
        echo -e "${RED}Invalid selection. Please enter a number between 1 and ${#DEVICES[@]}.${NC}"
    fi
done

echo ""
echo -e "${GREEN}Selected: ${DEVICE}${NC}"
echo ""

# Check if dotfiles directory exists
if [ -d "$DOTFILES_DIR" ]; then
    echo -e "${YELLOW}Dotfiles directory already exists at $DOTFILES_DIR${NC}"
    read -p "Remove and re-clone? [y/N]: " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm -rf "$DOTFILES_DIR"
    else
        echo "Aborting."
        exit 1
    fi
fi

# Clone repository
echo -e "${BLUE}Cloning dotfiles (branch: ${DEVICE})...${NC}"
git clone -b "$DEVICE" "$REPO_URL" "$DOTFILES_DIR"
cd "$DOTFILES_DIR"

echo ""
echo -e "${BLUE}Installing dotfiles...${NC}"
echo ""

# Ghostty (macOS)
if [ -f ".config/ghostty/config" ]; then
    echo "  Setting up Ghostty..."
    mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
    ln -sf "$DOTFILES_DIR/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
fi

# Zed
if [ -d ".config/zed" ]; then
    echo "  Setting up Zed..."
    mkdir -p "$HOME/.config/zed"
    [ -f ".config/zed/settings.json" ] && ln -sf "$DOTFILES_DIR/.config/zed/settings.json" "$HOME/.config/zed/settings.json"
    [ -f ".config/zed/keymap.json" ] && ln -sf "$DOTFILES_DIR/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json"
fi

# Kitty
if [ -f ".config/kitty/kitty.conf" ]; then
    echo "  Setting up Kitty..."
    mkdir -p "$HOME/.config/kitty"
    ln -sf "$DOTFILES_DIR/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
fi

# Fish
if [ -f ".config/fish/config.fish" ]; then
    echo "  Setting up Fish..."
    mkdir -p "$HOME/.config/fish"
    ln -sf "$DOTFILES_DIR/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
fi

# GitHub CLI
if [ -f ".config/gh/config.yml" ]; then
    echo "  Setting up GitHub CLI..."
    mkdir -p "$HOME/.config/gh"
    ln -sf "$DOTFILES_DIR/.config/gh/config.yml" "$HOME/.config/gh/config.yml"
fi

# Alacritty
if [ -f ".config/alacritty/alacritty.yml" ]; then
    echo "  Setting up Alacritty..."
    mkdir -p "$HOME/.config/alacritty"
    ln -sf "$DOTFILES_DIR/.config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
fi

# Helix
if [ -d ".config/helix" ]; then
    echo "  Setting up Helix..."
    mkdir -p "$HOME/.config/helix"
    [ -f ".config/helix/config.toml" ] && ln -sf "$DOTFILES_DIR/.config/helix/config.toml" "$HOME/.config/helix/config.toml"
    [ -d ".config/helix/themes" ] && ln -sf "$DOTFILES_DIR/.config/helix/themes" "$HOME/.config/helix/themes"
fi

# LunarVim
if [ -d ".config/lvim" ]; then
    echo "  Setting up LunarVim..."
    mkdir -p "$HOME/.config/lvim"
    [ -f ".config/lvim/config.lua" ] && ln -sf "$DOTFILES_DIR/.config/lvim/config.lua" "$HOME/.config/lvim/config.lua"
fi

# Git
if [ -f ".gitconfig" ]; then
    echo "  Setting up Git..."
    ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

# Git hooks
if [ -d ".git-hooks" ]; then
    echo "  Setting up Git hooks..."
    mkdir -p "$HOME/.git-hooks"
    for hook in .git-hooks/*; do
        [ -f "$hook" ] && ln -sf "$DOTFILES_DIR/$hook" "$HOME/$hook" && chmod +x "$HOME/$hook"
    done
fi

# Zsh
[ -f ".zshrc" ] && echo "  Setting up .zshrc..." && ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
[ -f ".zprofile" ] && echo "  Setting up .zprofile..." && ln -sf "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
[ -f ".zshenv" ] && echo "  Setting up .zshenv..." && ln -sf "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"

# Tool versions (asdf)
[ -f ".tool-versions" ] && echo "  Setting up .tool-versions..." && ln -sf "$DOTFILES_DIR/.tool-versions" "$HOME/.tool-versions"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║       Installation complete!          ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo "  1. Configure git (if .gitconfig was installed):"
echo "     git config --global user.name \"Your Name\""
echo "     git config --global user.email \"your.email@example.com\""
echo ""
echo "  2. Authenticate GitHub CLI (if installed):"
echo "     gh auth login"
echo ""
echo "  3. Restart your shell or run:"
echo "     source ~/.zshrc"
echo ""
