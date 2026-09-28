#!/usr/bin/env bash
set -e

# Get project dir
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")" 
PROJECT_DIR="$(dirname "$SCRIPT_PATH")"  

# All needed paths for setup
hypr_path="$HOME/.config/hypr"
waybar_path="$HOME/.config/waybar"

# Include logger function
source $PROJECT_DIR/setup_scripts/logger.sh


# ------------ Setup Hyprland configuration ------------
title "Setup Hyprland configuration"
source $PROJECT_DIR/setup_scripts/hyprland_setup.sh $PROJECT_DIR $hypr_path
success "Hyprland setup done"


# ------------ Setup Waybar configuration ------------
title "Setup Waybar configuration"
source $PROJECT_DIR/setup_scripts/waybar_setup.sh $PROJECT_DIR $waybar_path
success "Waybar setup done"


success "Setup Done."