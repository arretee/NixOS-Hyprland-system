#!/usr/bin/env bash

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")" 
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"  

# ----------------------------- Copy into ---------------------------------
hypr_path="$HOME/.config/hypr"

# Copy main hyprland.lua file
cp "${SCRIPT_DIR}/hyprland.lua" "${hypr_path}/hyprland.lua"

# Copy core part
mkdir "${hypr_path}/core"
cp -r "${SCRIPT_DIR}/core/." "${hypr_path}/core" 

# Copy scripts part
mkdir "${hypr_path}/scripts"
cp -r "${SCRIPT_DIR}/scripts/." "${hypr_path}/scripts" 

# Copy from apps only .lua files 
mkdir "${hypr_path}/apps"
for file in ${SCRIPT_DIR}/apps/*.lua; do    
    if [[ -f ${file} ]]; then
        file_name=$(basename ${file})
        cp ${SCRIPT_DIR}/apps/${file_name} "${hypr_path}/apps/${file_name}"
    fi
done 

echo "Done."