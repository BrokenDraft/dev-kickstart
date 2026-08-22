#!/bin/bash


usage() { echo "Usage: $0 [-p|--pull] [-s|--sway] [-d|--dbx]" 1>&2; exit 1; }

main () {
	for arg in "$@"; do
		case $arg in
			-p|--pull) pull_dotfile ; echo "pulled dot files" ; return 0 ;;
			-s|--sway) install_sway ; shift ;;
			-d|--dbx) install_distrobox ; shift ;;
		esac
	done
}

pull_dotfile() {
	mkdir -p .config/sway
	mkdir -p .config/waybar
	mkdir -p .config/distrobox
	mkdir -p .fonts
	cp -rf ~/.fonts/* .fonts
	cp -rf ~/.config/distrobox/* .config/distrobox
	cp -rf ~/.mydotrc .mydotrc
	cp -rf ~/.config/sway/* .config/sway
	cp -rf ~/.config/waybar/* .config/waybar
}

main
