#!/bin/bash

mkdir -p .config/sway
mkdir -p .config/waybar
mkdir -p .config/distrobox


cp -rf ~/.config/distrobox/* .config/distrobox
cp -rf ~/.mydotrc .mydotrc
cp -rf ~/.config/sway/* .config/sway
cp -rf ~/.config/waybar/* .config/waybar
