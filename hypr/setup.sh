#!/usr/bin/env bash
set -e


# Get project dir
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")" 
PROJECT_DIR="$(dirname "$SCRIPT_PATH")"  


# Include logger function
source "$PROJECT_DIR/setup_scripts/logger.sh"


# All needed paths for setup
hypr_path="$HOME/.config/hypr"
waybar_path="$HOME/.config/waybar"


# Get hostname
title "Get and check given host name"
HOST_NAME="$1"
echo "$PROJECT_DIR/hostnames/$HOST_NAME"

# Check if host name is given
if [[ "$HOST_NAME" == "" ]]; then
    error "No hostname is given"
    warning "You can use one of hostnames that represented in $PROJECT_DIR/hostnames"
    warning "Use it as first argument for setup"
    exit 1
fi

# Check host name exists
if [[ -d "$PROJECT_DIR/hostnames/$HOST_NAME" ]]; then
    success "Hostname exists: $HOST_NAME"
else
    error "No hostname found: $HOST_NAME"
    warning "You can use one of hostnames that represented in $PROJECT_DIR/hostnames"
    warning "Use it as first argument for setup"
    exit 1
fi 


# ------------ Setup Hyprland configuration ------------
title "Setup Hyprland configuration"
source "$PROJECT_DIR/setup_scripts/hyprland_setup.sh" "$PROJECT_DIR" "$hypr_path" "$HOST_NAME"
success "Hyprland setup done"

# ------------ Copy main colors for configuration ------------
title "Copy colors for configuration"
cp "$PROJECT_DIR/colors.css" "$hypr_path/colors.css"
info "colors copied"
success "All colors configuration copied"

# ------------ Setup Waybar configuration ------------
title "Setup Waybar configuration"
source "$PROJECT_DIR/setup_scripts/waybar_setup.sh" "$PROJECT_DIR" "$waybar_path" "$HOST_NAME"
success "Waybar setup done"


success "Setup Done."