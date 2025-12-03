#!/usr/bin/env bash

set -e


link_dir() {
	local src="$1"
	local dest="$2"

	echo "Linking $src -> $dest"

	mkdir -p "$(dirname "$dest")"
	rm -rf "$dest"
	ln -s "$src" "$dest"
}


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
