#!/bin/bash

mkdir -p .config/sway
mkdir -p .config/waybar

cp -rf ~/.mydotrc .mydotrc
cp -rf ~/.config/sway/* .config/sway
cp -rf ~/.config/waybar/* .config/waybar
