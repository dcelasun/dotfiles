# dotfiles

Various personal configuration files (bash, tmux, vim etc.)

Everything below assumes Arch Linux, but application specific parts should work on other \*nixes with minimal modifications.

## .bashrc

I have a simple `.bashrc` with some useful features:

- Start X by logging into `tty1`, no need for fancy display managers like [GDM](https://wiki.archlinux.org/index.php/GDM).
- Tab auto completion for `sudo` and `go`.
- `vim` as `$EDITOR`.
- Some useful functions and aliases.

## Powerline for Bash

Install [powerline](https://www.archlinux.org/packages/community/x86_64/powerline/) from the official repositories, and [powerline-fonts-git](https://aur.archlinux.org/packages/powerline-fonts-git/) from AUR.
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

Sane keybindings, some basic plugins like [yank](https://github.com/tmux-plugins/tmux-yank) (for copy/paste) and [resurrect](https://github.com/tmux-plugins/tmux-resurrect) (to save/restore tmux state).

- First, install [tpm](https://github.com/tmux-plugins/tpm), the tmux plugin manager:

```sh
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Copy `.tmux.conf` from this repository to `~/.tmux.conf`
- Run `tmux` and install all plugins with `Ctrl-A + I` (that's capital `i`).

## Gnome Terminal Theme

I use the Gnome Terminal [version](https://github.com/chriskempson/base16-gnome-terminal) of the excellent [base16](http://chriskempson.com/projects/base16/) project.

- Copy `config/base16-gnome-terminal` from this repository to `~/.config/base16-gnome-terminal`.
- Run the script for the theme you like, e.g:

```sh
source .config/base16-gnome-terminal/color-scripts/base16-oceanicnext-256.sh
```

Gnome Terminal will close. Open it again and choose the profile from right click -> Profiles.

## Gnome Terminal Font

- If you installed `powerline-fonts-git`, I recommend `Droid Sans Mono for Powerline Regular` in terminal settings.

## Screenshots

If you followed the steps for powerline, tmux and Gnome Terminal, it should look like this:

![Terminal](/screenshots/terminal.png?raw=true "Perfect.")

You can also run the `colors` function from `.bashrc` to see a nice grid of your current terminal color scheme:

![Colors](/screenshots/colors.png?raw=true "Color grid")
