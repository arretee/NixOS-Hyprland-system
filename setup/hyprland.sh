#!/usr/bin/env bash

# PATHS 
HYPR_PROJECT="$1"
HYPR_SYSTEM="$2"

HOST_NAME="$3"

SCRIPTS_PATH="$4"

# Includes
source "$SCRIPTS_PATH/logger.sh"
source "$SCRIPTS_PATH/functions.sh"


# Create hyprland config folder
info "Creating hyprland folder"
create_folder "$HYPR_SYSTEM"
echo

# Copy main hyprland configuration
info "Copy main hyprland configuration"
copy_file "$HYPR_PROJECT/hyprland.lua" "$HYPR_SYSTEM/hyprland.lua"
echo

# Copy colors for system
info "Copy color configuration for system" 
copy_file "$HYPR_PROJECT/colors.css" "$HYPR_SYSTEM/colors.css"
echo

# Create core folder 
info "Create core folder in hyprland folder"
create_folder "$HYPR_SYSTEM/core"
echo 

# Copy core general files
info "Copy hypr core general files"
copy_files "$HYPR_PROJECT/core" "$HYPR_SYSTEM/core"
echo 

# Copy core hostnames files
info "Copy hypr core hostname files"
copy_files "$HYPR_PROJECT/core/$HOST_NAME" "$HYPR_SYSTEM/core"
echo 

# Create apps folder
info "Create apps folder in hyprland folder"
create_folder "$HYPR_SYSTEM/apps"
echo

# Copy apps general files
info "Copy hypr apps general files"
copy_files "$HYPR_PROJECT/apps" "$HYPR_SYSTEM/apps"
echo 

# Create scripts folder
info "Create scripts folder in hyprland folder"
create_folder "$HYPR_SYSTEM/scripts"
echo

# Copy scripts general files
info "Copy hypr scripts general files"
copy_files "$HYPR_PROJECT/scripts" "$HYPR_SYSTEM/scripts"
echo 