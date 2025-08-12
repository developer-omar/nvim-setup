#!/bin/bash

# Define the Neovim configuration and data directories
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_LOCAL_SHARE_DIR="$HOME/.local/share/nvim"
NVIM_LOCAL_STATE_DIR="$HOME/.local/state/nvim" 
NVIM_LOCAL_CACHE_DIR="$HOME/.cache/nvim/"

# Proccess for deleting previous backup directories
directories = (NVIM_CONFIG_DIR NVIM_LOCAL_SHARE_DIR NVIM_LOCAL_STATE_DIR NVIM_LOCAL_CACHE_DIR)
for directory in "${directories[@]}"; do
    if [ -d "$directory{,.backup}" ]; then
        rm -rf "$directory{,.backup}"
    fi
done

# Check if the configuration directory exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Copying Neovim configuration directory: $NVIM_CONFIG_DIR"
    mv "$NVIM_CONFIG_DIR{,.backup}"
else
    echo "Neovim configuration directory not found: $NVIM_CONFIG_DIR"
fi

# Check if the local share directory exists
if [ -d "$NVIM_LOCAL_SHARE_DIR" ]; then
    echo "Copying Neovim local share directory: $NVIM_LOCAL_SHARE_DIR"
    mv "$NVIM_LOCAL_SHARE_DIR{,.backup}"  
else
    echo "Neovim local share directory not found: $NVIM_LOCAL_SHARE_DIR"
fi

# Check if the local state directory exists (for newer Neovim versions)
if [ -d "$NVIM_LOCAL_STATE_DIR" ]; then
    echo "Copying Neovim local state directory: $NVIM_LOCAL_STATE_DIR"
    mv  "$NVIM_LOCAL_STATE_DIR{,.backup}"
else
    echo "Neovim local state directory not found: $NVIM_LOCAL_STATE_DIR"
fi

# Check if the local cache directory exists
if [ -d "$NVIM_LOCAL_CACHE_DIR" ]; then
    echo "Copying Neovim local cache directory: $NVIM_LOCAL_CACHE_DIR"
    mv  "$NVIM_LOCAL_CACHE_DIR{,.backup}"
else
    echo "Neovim local cache directory not found: $NVIM_LOCAL_CACHE_DIR"
fi

echo "Neovim configurations have been protected."
