#!/usr/bin/env bash

# PATHS 
WAYBAR_PROJECT="$1"
WAYBAR_SYSTEM="$2"

HOST_NAME="$3"

SCRIPTS_PATH="$4"


# Create folder for waybar
info "Creating waybar folder"
create_folder "$WAYBAR_SYSTEM"
echo

# Copy main waybar style file
info "Copy general style file"
copy_file "$WAYBAR_PROJECT/style.css" "$WAYBAR_SYSTEM/style.css"

# Copy waybar files from hostname
info "Copy waybar hostname files"
copy_files "$WAYBAR_PROJECT/$HOST_NAME" "$WAYBAR_SYSTEM"
echo