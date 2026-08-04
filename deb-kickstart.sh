#!/bin/bash

# Setup folders for installation
mkdir -p ~/.local/tmp/bincurl
mkdir -p ~/.local/bin

# Get base packages
MYPACKAGES=("git" "curl" "wget" "python3")
sudo apt install ${MYPACKAGES[@]} -y


# Set binaries to CURL
declare -A TOCURL
TOCURL[ODIN]="https://github.com/odin-lang/Odin/releases/download/dev-2026-07a/odin-linux-amd64-dev-2026-07a.tar.gz"
TOCURL[GOLANG]+="https://go.dev/dl/go1.26.5.linux-amd64.tar.gz"

# Source - https://stackoverflow.com/a/14371026
# Posted by peteches, modified by community. See post 'Timeline' for change history
# Retrieved 2026-08-04, License - CC BY-SA 4.0

cd ~/.local/tmp/bincurl
for url in ${!TOCURL[@]}; do
    wget ${TOCURL[${url}]}
done



