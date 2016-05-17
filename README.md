# Getting Started

Clone this (or a forked version of this) repository.

    $ cd ~
    $ git clone https://github.com/neilsmind/dotfiles.git .dotfiles

**(Option 1)** If you'd like to symlink everything from this repository to your
home directory, run `install.rb`. This will also sync and update all the git
submodules within.

    $ cd ~/.dotfiles
    $ ./install.rb

This install script is idempotent, meaning you can run it over and over again
without fear of breaking anything. Use it as an installer or to upgrade after
merging from an upstream fork.

**(Option 2)** If you'd like to just symlink one or more configurations to your
home directory manually, you can.

    $ cd ~/.dotfiles
    $ ln -ns atom   ~/.atom
    $ ln -ns iterm2   ~/.iterm2

**(Option 3)** Just look around and pick and choose what you like for your own
  dotfiles.

## Notes

If you'd like to use git and github, be sure to add your own `~/.gitconfig_local` file:

```
[user]
  email = email@example.com
  name = Your Name
[github]
  user = your-github-username
```

## Requirements

* *nix environment (e.g. Mac OS X or Linux)
* Zsh version >= 3 (for command line enhancements)
* Atom version >= 1.7 (for atom config and setup)
* Ruby (for the install.rb to work)
