# dotfiles

Personal dotfiles managed per-device using git branches.

## Quick Install

```bash
bash <(curl -s https://raw.githubusercontent.com/raffaelschneider/dotfiles/main/install.sh)
```

Or clone and run manually:

```bash
git clone https://github.com/raffaelschneider/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Device Branches

Each device has its own branch with tailored configurations:

| Branch | Device | Description |
|--------|--------|-------------|
| `m4max` | Apple M4 Max | macOS, Ghostty, Zed, Kitty, Fish, Zsh |
| `m1max` | Apple M1 Max | macOS workstation |
| `x1carbon` | ThinkPad X1 Carbon | Linux laptop |
| `g5zbook` | HP ZBook G5 | Linux workstation |

## Structure

Each device branch contains:

```
dotfiles/
├── .config/
│   ├── ghostty/      # Terminal (macOS)
│   ├── zed/          # Editor
│   ├── kitty/        # Terminal
│   ├── fish/         # Shell
│   ├── gh/           # GitHub CLI
│   ├── alacritty/    # Terminal (Linux)
│   ├── helix/        # Editor
│   └── lvim/         # LunarVim
├── .git-hooks/       # Git hooks
├── .gitconfig        # Git configuration
├── .zshrc            # Zsh config
├── .zprofile         # Zsh profile
├── .zshenv           # Zsh environment
├── .tool-versions    # asdf versions
├── install.sh        # Branch-specific installer
└── README.md         # Branch documentation
```

## Manual Installation

To install a specific device configuration:

```bash
git clone -b <device> https://github.com/raffaelschneider/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Adding a New Device

1. Create a new orphan branch:
   ```bash
   git checkout --orphan <device-name>
   git rm -rf .
   ```

2. Add configurations for the device

3. Create a device-specific `install.sh` and `README.md`

4. Push the branch:
   ```bash
   git push -u origin <device-name>
   ```

5. Update the main branch `install.sh` to include the new device

## License

MIT
