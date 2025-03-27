#!/bin/bash

# Color Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Show startup banner with figlet
clear
figlet -f slant "Oracle VM Install"

echo -e "${CYAN}Starting Oracle VM VirtualBox installation on Arch Linux...${NC}"

# Update system
figlet "${YELLOW}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install Oracle VM VirtualBox and dependencies
figlet "${YELLOW}Installing Oracle VM VirtualBox and dependencies...${NC}"
sudo pacman -S --noconfirm virtualbox virtualbox-host-modules-arch

# Install additional tools if necessary
figlet "${YELLOW}Installing additional dependencies...${NC}"
sudo pacman -S --noconfirm linux-headers

# Load the VirtualBox kernel modules
figlet "${YELLOW}Loading VirtualBox kernel modules...${NC}"
sudo modprobe vboxdrv

# Add the user to the vboxusers group
figlet "${YELLOW}Adding current user to the vboxusers group...${NC}"
sudo usermod -aG vboxusers $USER

# Enable VirtualBox services
figlet "${YELLOW}Enabling VirtualBox services to start at boot...${NC}"
sudo systemctl enable vboxservice --now

# Completion message
figlet "${GREEN}Installation Complete!${NC}"
figlet "${CYAN}You may need to reboot your system for all changes to take effect.${NC}"

figlet "${BLUE}Thank you for using the Oracle VM VirtualBox installer!${NC}"

