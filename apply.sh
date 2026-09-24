#!/usr/bin/env bash

# Copy nixos configuration to /etc/nixos
sudo cp -r "nixos/." /etc/nixos

# Copy hyprland configuration to ~/.config/hypr
cp -r "hypr/." ~/.config/hypr
 
