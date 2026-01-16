# dotfiles - shared

Shared configurations used across all devices.

## Contents

- `.gitconfig` - Git configuration (user, aliases, signing, org includes)
- `.git-hooks/` - Custom git hooks

## Usage

This branch contains configs shared across devices. Device-specific branches can reference these files.

### Install shared configs only

```bash
git clone -b shared https://github.com/raffaelschneider/dotfiles.git ~/dotfiles-shared
cd ~/dotfiles-shared
./install.sh
```

### Post-install

Set your device-specific signing key:

```bash
git config --global user.signingkey ~/.ssh/id_ed25519.pub
```

## Organization Includes

The `.gitconfig` supports per-organization configs via `includeIf`:

- `~/.gitconfig-raskell-io`
- `~/.gitconfig-archipelag-io`
- `~/.gitconfig-wheelofheaven`
- `~/.gitconfig-raffaelschneider`

Create these files to override user settings per org.
