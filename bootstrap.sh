#!/usr/bin/env bash

set -e


### bashrc
# dotfiles/bash/bashrc -> ~/.bashrc
if [ -f "$PWD/bash/bashrc" ]; then
	ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
fi

### alacritty
# dotfiles/alacritty -> ~/.config/alacritty
if [ -d "$PWD/alacritty" ]; then
	link_dir "$PWD/alacritty" "$HOME/.config/alacritty"
fi
