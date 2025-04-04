#!/bin/bash

# Exit on error
set -e

echo "Starting development environment setup..."

# Update system
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install git
echo "Installing git..."
sudo pacman -S --noconfirm git

# Install yay AUR helper
echo "Installing yay AUR helper..."
if ! command -v yay &> /dev/null; then
    sudo pacman -S --noconfirm base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi


# Install JetBrains Toolbox (to manage JetBrains IDEs)
echo "Installing JetBrains Toolbox..."
yay -S --noconfirm jetbrains-toolbox

# Install Docker
echo "Installing Docker..."
sudo pacman -S --noconfirm docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo pacman -S --noconfirm docker-compose

# Install Postman
echo "Installing Postman..."
yay -S --noconfirm postman-bin

# Install Insomnia
echo "Installing Insomnia..."
yay -S --noconfirm insomnia

# Install AWS CLI
echo "Installing AWS CLI..."
sudo pacman -S --noconfirm aws-cli

# Install kubectl
echo "Installing kubectl..."
sudo pacman -S --noconfirm kubectl

# Install minikube
echo "Installing minikube..."
sudo pacman -S --noconfirm minikube

# Install htop
echo "Installing htop..."
sudo pacman -S --noconfirm htop

# Install ZSH utilities
echo "Installing ZSH and utilities..."
sudo pacman -S --noconfirm zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install build tools
echo "Installing build tools..."
sudo pacman -S --noconfirm base-devel cmake make gcc gdb

# Install Nerd Fonts
echo "Installing Nerd Fonts..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrains Mono Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -fv

# Install Node.js
echo "Installing Node.js..."
sudo pacman -S --noconfirm nodejs npm

# Install Java
echo "Installing Java..."
sudo pacman -S --noconfirm jdk-openjdk maven gradle

# Install Go
echo "Installing Golang..."
sudo pacman -S --noconfirm go

# Install Python
echo "Installing Python..."
sudo pacman -S --noconfirm python python-pip python-setuptools python-virtualenv

# Install GCC (already installed with base-devel)
echo "GCC is already installed with base-devel."

# Install Clang
echo "Installing Clang..."
sudo pacman -S --noconfirm clang

# Install Flutter
echo "Installing Flutter..."
yay -S --noconfirm flutter

# Install .NET
echo "Installing .NET..."
sudo pacman -S --noconfirm dotnet-sdk

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Install PHP
echo "Installing PHP..."
sudo pacman -S --noconfirm php php-fpm composer

# Install MariaDB
echo "Installing MariaDB..."
sudo pacman -S --noconfirm mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable --now mariadb

# Install PostgreSQL
echo "Installing PostgreSQL..."
sudo pacman -S --noconfirm postgresql
sudo -u postgres initdb -D /var/lib/postgres/data
sudo systemctl enable --now postgresql

# Install Redis
echo "Installing Redis..."
sudo pacman -S --noconfirm redis
sudo systemctl enable --now redis

# Install Perl
echo "Installing Perl..."
sudo pacman -S --noconfirm perl perl-modules

echo "All installations completed!"
echo "Some services may require a system restart or logout/login to take full effect."
echo "Remember to log out and back in for the Docker group changes to take effect."