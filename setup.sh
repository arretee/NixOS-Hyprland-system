#!/usr/bin/env bash
set -e

# Paths
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")" 
PROJECT_DIR="$(dirname "$SCRIPT_PATH")" 

NIXOS_SYSTEM="/etc/nixos"
HYPR_SYSTEM="$HOME/.config/hypr"
WAYBAR_SYSTEM="$HOME/.config/waybar"

# Imports
source "$PROJECT_DIR/setup/logger.sh"


# Check if host name is given
title "Check valid hostname"
HOST_NAME="$1"

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

# ------------------------------- Nixos Configuration -------------------------------
title "Setup nixos configuration"
source "$PROJECT_DIR/setup/nixos.sh" "$PROJECT_DIR/nixos" "$NIXOS_SYSTEM" "$HOST_NAME" "$PROJECT_DIR/setup"
success "Nixos cunfigured successfully"


# ------------------------------- Hyprland Configuration -------------------------------
title "Setup hyprland configuration"
source "$PROJECT_DIR/setup/hyprland.sh" "$PROJECT_DIR/hypr" "$HYPR_SYSTEM" "$HOST_NAME" "$PROJECT_DIR/setup"
success "Hyprland cunfigured successfully"

# ------------------------------- Waybar Configurtion -------------------------------
title "Setup waybar configuration"
source "$PROJECT_DIR/setup/waybar.sh" "$PROJECT_DIR/hypr/apps/waybar" "$WAYBAR_SYSTEM" "$HOST_NAME" "$PROJECT_DIR/setup"
success "Waybar cunfigured successfully"

# ------------------------------- ZSH Configuration -------------------------------






# ------------------------------- End of configuration -------------------------------
title " Configuration tips and instructinos "
info "Setup is copied all the files successfully!"
info "To apply changes use next steps"
info "1. sudo nixos-rebuild switch"
echo "That will rebuild nixos system with all needed packages and things"
info "2. reboot"
echo "That will reboot your PC to apply all configs and things"


echo
success "Good luck!"