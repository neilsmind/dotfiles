# dotfiles

My dotfiles.

## install

Run this:

```sh
git clone https://github.com/neilsmind/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

This will symlink the configuration files in `.dotfiles` to your home directory.
The install script creates backups of any existing files before symlinking.

## what's inside

- **zshrc**: Main zsh configuration with PATH setup and tool initialization
- **zshrc.d/**: Modular zsh configurations that get automatically loaded
- **gitconfig**: Git configuration with aliases and editor settings  
- **gitignore_global**: Global gitignore patterns
- **config/starship.toml**: Starship prompt configuration

## how it works

The main `zshrc` file sources everything in the `zshrc.d/` directory automatically.
This keeps configurations modular and organized by topic.

The `install.sh` script handles symlinking files to your home directory:
- `zshrc` → `~/.zshrc`
- `gitconfig` → `~/.gitconfig`
- `gitignore_global` → `~/.gitignore_global`
- `config/starship.toml` → `~/.config/starship.toml`

## local customizations

Create these files for personal settings that won't be tracked in git:
- `~/.zshrc.local` - for shell customizations
- `~/.gitconfig_local` - for git user info and personal settings

## dependencies

These dotfiles expect you have:
- zsh as your shell
- git
- Optional: starship, fnm, rbenv, pyenv, direnv, hub

## fork it

If you want to use these as a starting point, fork this repo and modify to your
liking. Remove what you don't use, add what you need.