#!/usr/bin/env bash

# Paths
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")" 
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")" 

# include logger
source "$SCRIPT_DIR/logger.sh"

copy_files() {
    SRC="$1"
    DST="$2"
    echo "--- src path: $SRC"
    echo "--- dst path: $DST"



    for file in $SRC/*; do
        if [[ -f "$file" ]]; then
            file_name=$(basename ${file})
            cp "$SRC/${file_name}" "$DST/${file_name}"
            echo "file copied: ${file_name}"
        fi
    done
}

create_folder() {
    DST="$1"

    mkdir -p "$DST"
    echo "Folder created: $DST"
}

copy_file(){
    FILE="$1"
    DST="$2"

    cp "$FILE" "$DST"
    echo "file copied into: $DST"
}

sudo_copy_files() {
    SRC="$1"
    DST="$2"
    echo "--- src path: $SRC"
    echo "--- dst path: $DST"



    for file in $SRC/*; do
        if [[ -f "$file" ]]; then
            file_name=$(basename ${file})
            sudo cp "$SRC/${file_name}" "$DST/${file_name}"
            echo "file copied: ${file_name}"
        fi
    done
}

sudo_create_folder() {
    DST="$1"

    sudo mkdir -p "$DST"
    echo "Folder created: $DST"
}

sudo_copy_file(){
    FILE="$1"
    DST="$2"

    sudo cp "$FILE" "$DST"
    echo "file copied into: $DST"
}