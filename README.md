# dotfiles-backup

Backup of shell/editor/terminal config files from this machine, mirrored under `home/` with paths relative to `$HOME` (e.g. `home/.zshrc` restores to `~/.zshrc`).

## What's included
- `.zshrc`, `.zshenv`
- `.bashrc`, `.bash_logout`
- `.profile`
- `.gitconfig`
- `.config/ghostty/config.ghostty`
- `.config/git/ignore`
- `.config/starship.toml`

## What's intentionally excluded
- **Neovim config** — already its own repo: https://github.com/xd-dbug/kickstart.nvim
- Anything containing credentials (SSH/GPG keys, cloud credentials, password stores) — never copied here.
- Large personal directories (`User/`, `Neumont/`) — out of scope for a git-based backup; too large and full of build artifacts/binaries.

## Usage

**Update the backup** (after changing a dotfile):
```
./sync.sh
git diff
git add -A
git commit -m "Sync dotfiles"
git push
```

**Restore on a machine**:
```
git clone https://github.com/xd-dbug/dotfiles-backup.git
cd dotfiles-backup
./install.sh
```
`install.sh` backs up any existing file at the destination to `<file>.bak` before overwriting it.
