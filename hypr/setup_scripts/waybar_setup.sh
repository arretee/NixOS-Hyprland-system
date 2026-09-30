#!/usr/bin/env bash

# Needed paths for script
PROJECT_DIR=$1

# Host name
HOST_NAME=$3

WAYBAR_PROJECT_DIR="$PROJECT_DIR/apps/waybar/$HOST_NAME"
WAYBAR_SYSTEM_DIR=$2



# Include logger
source "$PROJECT_DIR/setup_scripts/logger.sh"


# Create Waybar folder
mkdir -p $WAYBAR_SYSTEM_DIR
info "created folder for waybar in: $WAYBAR_SYSTEM_DIR"


# Copy waybar folder content
cp -r "$WAYBAR_PROJECT_DIR/." "$WAYBAR_SYSTEM_DIR"
info "Waybar files copied into: $WAYBAR_SYSTEM_DIR"


# Restart waybar if it was active
pkill waybar && waybar & 