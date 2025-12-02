#!/bin/bash

path=$(pwd)
ln -sf $path/.bashrc $HOME
ln -sf $path/.xinitrc $HOME
ln -sf $path/.fzf.bash $HOME
ln -sf $path/.dircolors $HOME
ln -sf $path/Makefile $HOME

# Handle Fonts
if [ ! -d "$HOME/.fonts" ]; then
  mkdir $HOME/.fonts
fi
for VAR in $(ls $path/.fonts/)
  do
    ln -sf $path/.fonts/$VAR $HOME/.fonts/$VAR
  done

# Handle Alarcitty
if [ ! -d "$HOME/.config/alacritty/" ]; then
  mkdir $HOME/.config/alacritty/
fi
ln -sf $path/.config/alacritty/alacritty.toml $HOME/.config/alacritty/
