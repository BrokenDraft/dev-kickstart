#!/bin/bash

set -euo pipefail

# Setup folders for installation
TMPBINCURL="$HOME/.local/tmp/bincurl"
mkdir -p $TMPBINCURL 
cd "$TMPBINCURL"

LOCALBIN="$HOME/.local/bin"
mkdir -p $LOCALBIN



# Get base packages
MYPACKAGES=("llvm" "llvm-devel" "clang" "git" "curl" "wget" "python3" "tar" "distrobox")
sudo apt install ${MYPACKAGES[@]} -y

addline_profile() {
    local target_files=( "$HOME/.profile" "$HOME/.bashrc" "$HOME/.zshrc" )
    
    for file in "${target_files[@]}"; do
        # Only check/write if the file actually exists on the user's system
        if [ -f "$file" ]; then
            if ! grep -qsF "$1" "$file"; then
                printf '%s\n' "$1" >> "$file"
            fi
        fi
    done
}


# Set binaries to CURL
declare -A TOCURL
TOCURL[ODIN]="https://github.com/odin-lang/Odin/releases/download/dev-2026-07a/odin-linux-amd64-dev-2026-07a.tar.gz"
TOCURL[GOLANG]+="https://go.dev/dl/go1.26.5.linux-amd64.tar.gz"

cd "$TMPBINCURL"
for key in ${!TOCURL[@]}; do
    url="${TOCURL[$key]}"
    filename="$(basename "$url")"

    if [ ! -f "$filename" ]; then
        echo "Downloading $key..."
        curl -L "$url" > $filename
    else
        echo "$key already downloaded ($filename)."
    fi
done

# Setup needed binaries
### GOLANG
golang_archive="${TMPBINCURL}/$(basename "${TOCURL[GOLANG]}")"

if [ -f "$golang_archive" ]; then
    # Unpack to /usr/local (requires elevated privileges)
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf "$golang_archive"

    # Safely append PATH to ~/.profile if not already present
    export_cmd='export PATH=$PATH:/usr/local/go/bin'
    addline_profile "$export_cmd"
else
    echo "Error: Archive $golang_archive not found." >&2
    exit 1
fi


### Setup Odin
odin_archive="${TMPBINCURL}/$(basename "${TOCURL[ODIN]}")"
odin_path="$HOME/.local/odin"
mkdir -p $odin_path

if [ -f "$odin_archive" ]; then
    tar -C $odin_path -xzf "$odin_archive" --strip-components=1

    export_cmd="export PATH=\$PATH:\$HOME/.local/odin"
    addline_profile "$export_cmd"
else
    echo "Error: Archive $odin_archive not found." >&2
    exit 1 
fi


