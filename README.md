# dotfiles

Various personal configuration files (Wayland, bash, tmux, vim, git etc.)

Everything below assumes Arch Linux, but application specific parts should work on other \*nixes with minimal modifications.

I use a pretty barebones Gnome Desktop under Wayland, with default themes and fonts (Adwaita), and almost no extensions.

## .bashrc

I have a simple `.bashrc` with some useful features:

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
. /usr/lib/python/3.7/site-packages/powerline/bindings/bash/powerline.sh
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

I use the "Chalk" theme from the excellent [Gogh](http://mayccoll.github.io/Gogh/).

- Make sure you have at least 1 custom profile enabled in Gnome Terminal, otherwise this won't work! Create a dummy if you need to.
- [Install](https://github.com/Mayccoll/Gogh/blob/master/content/install.md#install) Gogh. Arch Linux users can use the [AUR package](https://aur.archlinux.org/packages/gogh-git/).
- Run `gogh` in a terminal.
- Type `23` and hit <kbd>enter</kbd>.
- Right click anywhere in terminal and choose `Profiles -> Chalk`.

## Gnome Terminal Font

- If you installed `powerline-fonts-git`, I recommend `Droid Sans Mono for Powerline Regular` in terminal settings.

## Screenshots

If you followed the steps for powerline, tmux and Gnome Terminal, it should look like this:

<p align="center">
    <img src="/screenshots/terminal.png" alt="Screenshot of Gnome Terminal showing fastfetch output">
</p>

You can also run the `colors` function from `.bashrc` to see a nice grid of your current terminal color scheme:

<p align="center">
    <img src="/screenshots/colors.png" alt="Screenshot of Gnome Terminal showing the output of the colors function">
</p>
