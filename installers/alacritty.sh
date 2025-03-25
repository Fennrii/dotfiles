#!/bin/bash
# Install cargo (dependency)
curl https://sh.rustup.rs -sSf | sh
mkdir -p $HOME/.fonts
cd $HOME/.fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
cargo install alacritty
