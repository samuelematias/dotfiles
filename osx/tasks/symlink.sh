#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
	"zsh"
	"git"
	"alacritty"
	"tmux"
    "config_files"
    "editorconfig"
)

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
	echo "🔗 Linking dotfile: $HOME/${dotfile}"
	stow $dotfile --ignore ".DS_Store"
done
