# dotfiles

Personal dotfiles for macOS development environment.

## Branch: m4max

Configuration for Apple Silicon M4 Max.

## Tools

- **Ghostty** - Terminal emulator
- **Zed** - Code editor
- **Kitty** - Terminal emulator
- **Fish** - Shell
- **Zsh** - Shell
- **Git** - Version control with SSH signing
- **GitHub CLI** - GitHub from terminal

## Install

```bash
# Clone
git clone -b m4max https://github.com/raffaelschneider/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run installer
./install.sh
```

## Manual Setup

```bash
# Ghostty
ln -sf ~/dotfiles/.config/ghostty ~/Library/Application\ Support/com.mitchellh.ghostty

# Zed
ln -sf ~/dotfiles/.config/zed ~/.config/zed

# Kitty
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty

# Fish
ln -sf ~/dotfiles/.config/fish ~/.config/fish

# GitHub CLI
ln -sf ~/dotfiles/.config/gh ~/.config/gh

# Git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.git-hooks ~/.git-hooks

# Zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshenv ~/.zshenv
```

## Post-Install

```bash
# Git user config
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global user.signingkey "/path/to/key.pub"

# GitHub CLI auth
gh auth login
```

## Theme

**Catppuccin Macchiato** across Ghostty and Zed.

## Font

**IBM Plex Mono** / **Zed Plex Mono**

## Other Branches

- `m1max` - M1 Max Mac
- `x1carbon` - ThinkPad X1 Carbon
- `g5zbook` - Other device
