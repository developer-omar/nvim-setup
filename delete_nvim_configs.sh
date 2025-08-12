#!/bin/bash

# Define the Neovim configuration and data directories
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_LOCAL_SHARE_DIR="$HOME/.local/share/nvim"
NVIM_LOCAL_STATE_DIR="$HOME/.local/state/nvim" # For newer Neovim versions
NVIM_LOCAL_CACHE_DIR="$HOME/.cache/nvim/"

# Check if the configuration directory exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Deleting Neovim configuration directory: $NVIM_CONFIG_DIR"
    rm -rf "$NVIM_CONFIG_DIR"
else
    echo "Neovim configuration directory not found: $NVIM_CONFIG_DIR"
fi

# Check if the local share directory exists
if [ -d "$NVIM_LOCAL_SHARE_DIR" ]; then
    echo "Deleting Neovim local share directory: $NVIM_LOCAL_SHARE_DIR"
    rm -rf "$NVIM_LOCAL_SHARE_DIR"
else
    echo "Neovim local share directory not found: $NVIM_LOCAL_SHARE_DIR"
fi

# Check if the local state directory exists (for newer Neovim versions)
if [ -d "$NVIM_LOCAL_STATE_DIR" ]; then
    echo "Deleting Neovim local state directory: $NVIM_LOCAL_STATE_DIR"
    rm -rf "$NVIM_LOCAL_STATE_DIR"
else
    echo "Neovim local state directory not found: $NVIM_LOCAL_STATE_DIR"
fi

# Check if the local cache directory exists
if [ -d "$NVIM_LOCAL_CACHE_DIR" ]; then
    echo "Deleting Neovim local cache directory: $NVIM_LOCAL_CACHE_DIR"
    rm -rf "$NVIM_LOCAL_CACHE_DIR"
else
    echo "Neovim local cache directory not found: $NVIM_LOCAL_CACHE_DIR"
fi

echo "Neovim configuration cleanup complete."
