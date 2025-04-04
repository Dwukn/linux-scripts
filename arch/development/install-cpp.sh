#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo dnf update -y

# Install GCC and G++
echo "Installing GCC and G++..."
sudo dnf install -y gcc gcc-c++

# Install make
echo "Installing make..."
sudo dnf install -y make

# Install CMake
echo "Installing CMake..."
sudo dnf install -y cmake

# Install GDB
echo "Installing GDB..."
sudo dnf install -y gdb

# Install Boost libraries (optional, remove if not needed)
echo "Installing Boost libraries..."
sudo dnf install -y boost-devel

# Install Code::Blocks (optional, remove if not needed)
#echo "Installing Code::Blocks..."
#sudo dnf install -y codeblocks

# Install Qt Creator (optional, remove if not needed)
#echo "Installing Qt Creator..."
#sudo dnf install -y qt-creator

# Install Visual Studio Code (optional, remove if not needed)
#echo "Installing Visual Studio Code..."
#sudo dnf install -y code

# Install Eclipse CDT (optional, remove if not needed)
#echo "Installing Eclipse CDT..."
#sudo dnf install -y eclipse-cdt

echo "C++ development environment setup complete!"
