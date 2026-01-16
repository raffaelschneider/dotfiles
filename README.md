# dotfiles - m1imac

Configuration for Apple M1 iMac.

## Install

```bash
git clone -b m1imac https://github.com/raffaelschneider/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Contents

- `.config/ghostty/` - Terminal
- `.config/zed/` - Editor
- `.config/kitty/` - Terminal
- `.config/fish/` - Shell
- `.config/gh/` - GitHub CLI
- `.zshrc`, `.zprofile`, `.zshenv` - Zsh

## Shared Configs

Git configuration is managed in the `shared` branch. After running install:

```bash
# Install shared configs (.gitconfig, .git-hooks)
git clone -b shared https://github.com/raffaelschneider/dotfiles.git ~/dotfiles-shared
cd ~/dotfiles-shared && ./install.sh

# Set device-specific signing key
git config --global user.signingkey ~/.ssh/id_ed25519_imac.pub
```

## Theme

**Catppuccin Macchiato** across Ghostty and Zed.

## Font

**IBM Plex Mono** / **Zed Plex Mono**
