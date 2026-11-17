# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## New machine (Debian/Ubuntu)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply hvnxdr
```

That installs chezmoi, clones this repo, installs zsh/git/tmux/mise, sets zsh as
the login shell, pulls in oh-my-zsh, and writes the dotfiles. Log out and back in
afterwards for the shell change.

## Day to day

```sh
chezmoi edit ~/.zshrc     # edit the source copy
chezmoi diff              # preview
chezmoi apply             # write to $HOME
chezmoi re-add            # pull live edits back into the repo
chezmoi cd                # shell in the repo; git add/commit/push from there
```

## Never commit
SSH private keys, API tokens, `.env` files, `~/.config/opencode`, `~/.claude*`.
