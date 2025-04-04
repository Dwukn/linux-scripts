#!/bin/bash

# Color Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to display messages in color
display_message() {
    local message=$1
    local color=$2
    echo -e "${color}${message}${NC}"
}

# Function to display a banner
show_banner() {
    local text=$1
    figlet -f slant "$text"
}

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    display_message "You must run this script as root!" "$RED"
    exit 1
fi

# Show startup banner
clear
show_banner "Oracle VM Install"
display_message "Starting Oracle VM VirtualBox installation on Arch Linux..." "$CYAN"

# Update system
show_banner "Updating system..."
display_message "Updating system..." "$YELLOW"
sudo pacman -Syu --noconfirm

# Check and install Oracle VM VirtualBox if not installed
show_banner "Installing Oracle VM VirtualBox and dependencies..."
if ! pacman -Qi virtualbox &>/dev/null; then
    display_message "Installing Oracle VM VirtualBox..." "$YELLOW"
    sudo pacman -S --noconfirm virtualbox virtualbox-host-modules-arch
else
    display_message "Oracle VM VirtualBox is already installed!" "$GREEN"
fi

# Check and install linux-headers if not installed
show_banner "Installing additional dependencies..."
if ! pacman -Qi linux-headers &>/dev/null; then
    display_message "Installing linux-headers..." "$YELLOW"
    sudo pacman -S --noconfirm linux-headers
else
    display_message "Linux headers are already installed!" "$GREEN"
fi

# Load the VirtualBox kernel modules
show_banner "Loading VirtualBox kernel modules..."
display_message "Loading VirtualBox kernel modules..." "$YELLOW"
sudo modprobe vboxdrv

# Add the user to the vboxusers group
show_banner "Adding current user to the vboxusers group..."
display_message "Adding current user to the vboxusers group..." "$YELLOW"
sudo usermod -aG vboxusers "$USER"

# Enable VirtualBox services
show_banner "Enabling VirtualBox services..."
display_message "Enabling VirtualBox services to start at boot..." "$YELLOW"
sudo systemctl enable vboxservice --now

# Completion message
show_banner "Installation Complete!"
display_message "You may need to reboot your system for all changes to take effect." "$CYAN"
display_message "Thank you for using the Oracle VM VirtualBox installer!" "$BLUE"
