#!/bin/bash

# Define colors
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m' # No Color

# Update system
echo -e "${YELLOW}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install Hyprland and essential packages
echo -e "${YELLOW}Installing Hyprland and required packages...${NC}"
PACKAGES=(
    base-devel git hyprland wayland wlroots xdg-desktop-portal-hyprland
    mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
    thunar gvfs kitty wofi brightnessctl
    pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber
)

for package in "${PACKAGES[@]}"; do
    if pacman -Qi $package &>/dev/null; then
        echo -e "${YELLOW}$package is already installed, skipping.${NC}"
    else
        sudo pacman -S --noconfirm $package
    fi
done

# Completion message
echo -e "${GREEN}Installation complete! Reboot your system to apply changes.${NC}"
