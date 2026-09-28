#!/usr/bin/env bash

# Get needed paths
PROJECT_DIR=$1
HYPR_PATH=$2

# Get logger functions
source $PROJECT_DIR/setup_scripts/logger.sh


# Copy main hyprland.lua file
sub_title "Setup main hyprland config file"
cp "${PROJECT_DIR}/hyprland.lua" "${HYPR_PATH}/hyprland.lua"
info "Copy hyprland.lua"


# Copy core part
sub_title "Setup core part hyprland config"
mkdir -p "${HYPR_PATH}/core"
info "Created core dir"
for file in ${PROJECT_DIR}/core/*; do
    file_name=$(basename ${file})
    cp ${PROJECT_DIR}/core/${file_name} "${HYPR_PATH}/core/${file_name}"
    info "file copied: ${file_name}"
done

# Copy scripts part
sub_title "Setup scripts part hyprland config"
mkdir -p "${HYPR_PATH}/scripts"
info "Created scripts dir"
for file in ${PROJECT_DIR}/scripts/*; do
    file_name=$(basename ${file})
    cp ${PROJECT_DIR}/scripts/${file_name} "${HYPR_PATH}/scripts/${file_name}"
    info "file copied: ${file_name}"
done


# Copy from apps only .lua files 
sub_title "Setup apps .lua files part hyprland config"
mkdir -p "${HYPR_PATH}/apps"
for file in ${PROJECT_DIR}/apps/*.lua; do    
    if [[ -f ${file} ]]; then
        file_name=$(basename ${file})
        cp ${PROJECT_DIR}/apps/${file_name} "${HYPR_PATH}/apps/${file_name}"
        info "file copied: ${file_name}"
    fi
done 