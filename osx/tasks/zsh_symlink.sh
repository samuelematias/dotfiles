#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=("zsh")

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
	echo "🔗 Linking .zshrc: $HOME/${dotfile}"
	stow $dotfile --ignore ".DS_Store"
done
