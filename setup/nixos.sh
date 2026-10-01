#!/usr/bin/env bash

# PATHS 
NIXOS_PROJECT="$1"
NIXOS_SYSTEM="$2"

HOST_NAME="$3"

SCRIPTS_PATH="$4"


# Includes
source "$SCRIPTS_PATH/logger.sh"
source "$SCRIPTS_PATH/functions.sh"


# Create nioxs folder if not exists
info "Creating nixos folder in system"
sudo_create_folder "$NIXOS_SYSTEM"
echo

# Copy main configuration
info "Copy main configuration file"
sudo_copy_file "$NIXOS_PROJECT/configuration.nix" "$NIXOS_SYSTEM/configuration.nix"
echo

# Create imports folder
info "Creating imports folder inside the nixos"
sudo_create_folder "$NIXOS_SYSTEM/imports"
echo

# Copy general files to imports
info "Copy all general files of nixos/imports"
sudo_copy_files "$NIXOS_PROJECT/imports" "$NIXOS_SYSTEM/imports"
echo

# Copy hostname files to imports
info "Copy all hostname files of nixos/imports"
sudo_copy_files "$NIXOS_PROJECT/imports/$HOST_NAME" "$NIXOS_SYSTEM/imports"
echo

