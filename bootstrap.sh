#!/usr/bin/env bash

set -e


### bashrc
# dotfiles/bash/bashrc -> ~/.bashrc
if [ -f "$PWD/bash/bashrc" ]; then
	ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
fi
