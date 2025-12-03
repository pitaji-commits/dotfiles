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

### emacs
# dotfiles/emacs.d -> ~/.emacs.d
if [ -d "$PWD/emacs.d" ]; then
	link_dir "$PWD/emacs.d" "$HOME/.emacs.d"
fi

### neovim
# dotfiles/nvim -> ~/.config/nvim
if [ -d "$PWD/nvim" ]; then
	link_dir "$PWD/nvim" "$HOME/.config/nvim"
fi

### i3
# dotfiles/i3 -> ~/.config/i3
if [ -d "$PWD/i3" ]; then
    link_dir "$PWD/i3" "$HOME/.config/i3"
fi

### i3status
# dotfiles/i3status -> ~/.config/i3
if [ -d "$PWD/i3status" ]; then
    link_dir "$PWD/i3status" "$HOME/.config/i3status"
fi

### Tmux
# dotfiles/tmux -> ~/.config/tmux
if [ -f "$PWD/tmux/tmux.conf" ]; then
    ln -sf "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
fi

### mpv
# dotfiles/mpv -> ~/.config/mpv
if [ -d "$PWD/mpv" ]; then
    link_dir "$PWD/mpv" "$HOME/.config/mpv"
fi

### scripts
# dotfiles/scripts -> ~/.config/scripts
if [ -d "$PWD/scripts" ]; then
    link_dir "$PWD/scripts" "$HOME/.config/scripts"

    chmod +x "$PWD"/scripts/*.sh 2>/dev/null || true
    chmod +x "$HOME"/.config/scripts/*.sh 2>/dev/null || true
fi

echo "All done!"
