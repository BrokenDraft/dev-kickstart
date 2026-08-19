#!/bin/bash

sudo apt update && sudo apt install lua5.4 tree-sitter-cli ripgrep xclip

cd ~/.local/bin && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage

