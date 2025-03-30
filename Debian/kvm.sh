#!/bin/bash

# Display a fun greeting with Figlet and Lolcat
clear
figlet "QEMU Installer"
echo "Meow! Let's get you up and running with QEMU on Debian!"
echo "---------------------------------------------"
echo "Purrfect! This script will install QEMU, KVM, and other essential tools."
echo "---------------------------------------------"
lolcat "Installing QEMU... Hold on to your paws!"

# Update the system
echo "Meow! Updating your system, pls wait... 🐾"
sudo apt update && sudo apt upgrade -y

# Install QEMU (only if not installed)
echo "Purr! Checking if QEMU is installed... 🐾"
if ! command -v qemu &> /dev/null; then
    echo "QEMU is not installed. Installing QEMU now... 🐱"
    sudo apt install -y qemu
else
    echo "QEMU is already installed. Skipping installation. 🐾"
fi

# Install virt-manager for GUI (only if not installed)
echo "Meow! Checking if virt-manager is installed... 🐾"
if ! command -v virt-manager &> /dev/null; then
    echo "Virt-Manager is not installed. Installing Virt-Manager now... 🐱"
    sudo apt install -y virt-manager
else
    echo "Virt-Manager is already installed. Skipping installation. 🐾"
fi

# Install libvirt for KVM (only if not installed)
echo "Purr! Checking if libvirt is installed... 🐾"
if ! command -v virsh &> /dev/null; then
    echo "Libvirt is not installed. Installing Libvirt now... 🐱"
    sudo apt install -y libvirt-daemon-system libvirt-clients
else
    echo "Libvirt is already installed. Skipping installation. 🐾"
fi

# Check KVM support
echo "Checking if your Intel i7 CPU supports KVM (hardware virtualization)... 🐱"
kvm_supported=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
if [[ "$kvm_supported" -gt 0 ]]; then
    echo "Yay! Your CPU supports hardware virtualization! 🐾"
else
    echo "Uh-oh! Your CPU doesn't support hardware virtualization. 😿"
fi

# Enable and start libvirt service (only if not already running)
echo "Checking if libvirt service is running... 🐾"
if systemctl is-active --quiet libvirtd; then
    echo "Libvirt service is already running. Skipping... 🐱"
else
    echo "Starting and enabling libvirt service for virtual machines... 🐾"
    sudo systemctl enable --now libvirtd
fi

# Add user to the libvirt and kvm groups (only if not already added)
echo "Adding your user to the libvirt and kvm groups... 🐾"
if groups $(whoami) | grep &>/dev/null '\b(libvirt|kvm)\b'; then
    echo "You are already in the libvirt and kvm groups. Skipping... 🐱"
else
    echo "You are not in the libvirt or kvm groups. Adding you now... 🐾"
    sudo usermod -aG libvirt,kvm $(whoami)
fi

# Inform the user to log out and log back in
echo "Meow! 🐾 You must log out and log back in to apply group changes. Then you can manage VMs!"
lolcat "Don't forget to log out, okay? 🐾"

# Final message
figlet "Done!"
echo "Your system is now ready to run virtual machines with QEMU! 🐱"
echo "Meow, have fun with your virtual environments! 🐾"

