# dotfiles

Various configuration files (bash, tmux, vim etc.)

Everything below assumes Arch Linux, but most of the application specific parts should be usable on other \*nixes.

## Powerline for Bash

Install powerline from the official repositories, and powerline-fonts-git from AUR.
```sh
$ pacman -S powerline powerline-vim
$ packer -S powerline-fonts-git
```

Prepend the following to your `.bashrc`:

```sh
# Powerline config
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python/3.6/site-packages/powerline/bindings/bash/powerline.sh
```

## Vim Configuration

I use the [basic version](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) of [amix](https://github.com/amix/vimrc)'s ultimate Vim configuration.

## Tmux Configuration

Sane keybindings, some basic plugins like yank (for copy/paste) and resurrect (to save/restore tmux state).

- First, install [tpm](https://github.com/tmux-plugins/tpm), the tmux plugin manager:

```sh
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Copy `.tmux.conf` from this repository to `~/.tmux.conf`
- Run `tmux` and install all plugins with `Ctrl-A + I` (that's capital `i`).

## Gnome Terminal Theme

- Copy `config/base16-gnome-terminal` from this repository to `~/.config/base16-gnome-terminal`.
- Run the script for the theme you like, e.g:

```sh
source .config/base16-gnome-terminal/color-scripts/base16-oceanicnext-256.sh
```

Gnome Terminal will close. Open it again and choose the profile from right click -> Profiles.

## Screenshot

If you followed the steps for powerline, tmux and Gnome Terminal, it should look like this:

![Terminal](/screenshots/terminal.png?raw=true "Perfect.")
