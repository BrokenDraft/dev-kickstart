#!/bin/bash

usage() { echo "Usage: $0 [-p|--pull] [-s|--sway] [-d|--dbx]" 1>&2; exit 1; }

main () {
	if [ "$1" == "" ]; then
		usage
		return 0
	fi
	
	for arg in "$@"; do
		case $arg in
			-p|--pull) pull_dotfile ; echo "Oki Doki" ; return 0 ;;
			-s|--sway) install_sway ; shift ;;
			-d|--dbx) install_distrobox ; shift ;;
		esac
	done
}

pull_dotfile() {
	mkdir -p .config/sway
	mkdir -p .config/waybar
	mkdir -p .config/foot
	mkdir -p .config/distrobox
	mkdir -p .fonts
	
	cp -rf ~/.config/foot/* .config/foot && echo "Saved foot config"
	cp -rf ~/.fonts/* .fonts && echo "Saved fonts config"
	cp -rf ~/.config/distrobox/* .config/distrobox && echo "Saved distrobox config"
	cp -rf ~/.mydotrc .mydotrc && echo "Saved mydotrc"
	cp -rf ~/.config/sway/* .config/sway && echo "Saved sway config"
	cp -rf ~/.config/waybar/* .config/waybar && echo "Saved waybar config"
}

main $@
