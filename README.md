# Direct Install Scripts for Linux

This repository contains direct install scripts for a variety of software packages on different Linux distributions. The goal is to make software installation as easy and seamless as possible by providing ready-to-use shell scripts for automated installation.

Currently supported Linux distributions:
- **Arch Linux**
- **Fedora**
- **Debian/Ubuntu**

## Supported Software

- **Oracle VM VirtualBox**
- **Docker**
- **Node.js**
- **VLC Media Player**
- **Git**
- **And many more...**

Each software package has its own dedicated script for each supported Linux distribution. These scripts ensure that all dependencies are handled, configurations are set up, and services are enabled where necessary.

## Features

- **Automated Installation**: One-click install for software packages on **Arch Linux**, **Fedora**, and **Debian/Ubuntu**.
- **Dependencies Handled**: Automatically installs any necessary dependencies (like kernel headers for VirtualBox).
- **System Updates**: The script starts by updating the system to ensure all packages are up-to-date.
- **Service Management**: Where applicable, services are enabled to start at boot.

## Prerequisites

- **Root (sudo) privileges** are required to run these scripts.
- **Figlet** is used for displaying banner messages during installation. You may need to install it manually:
    - **Arch Linux**: `sudo pacman -S figlet`
    - **Fedora**: `sudo dnf install figlet`
    - **Debian/Ubuntu**: `sudo apt install figlet`

## Installation Instructions

### Arch Linux
To install software on **Arch Linux**, follow these steps:

1. **Choose a script** from the list below for the software you want to install:
   - [Oracle VM VirtualBox](scripts/arch/install-virtualbox.sh)
   - [Docker](scripts/arch/install-docker.sh)
   - [Node.js](scripts/arch/install-nodejs.sh)
   - [VLC Media Player](scripts/arch/install-vlc.sh)

2. Download the installation script:
   ```bash
   curl -O https://raw.githubusercontent.com/your-repo/linux-install-scripts/arch/install-software-name.sh
   ```

3. Make the script executable:
   ```bash
   chmod +x install-software-name.sh
   ```

4. Run the script:
   ```bash
   sudo ./install-software-name.sh
   ```

### Fedora
To install software on **Fedora**, follow these steps:

1. **Choose a script** from the list below for the software you want to install:
   - [Oracle VM VirtualBox](scripts/fedora/install-virtualbox.sh)
   - [Docker](scripts/fedora/install-docker.sh)
   - [Node.js](scripts/fedora/install-nodejs.sh)
   - [VLC Media Player](scripts/fedora/install-vlc.sh)

2. Download the installation script:
   ```bash
   curl -O https://raw.githubusercontent.com/your-repo/linux-install-scripts/fedora/install-software-name.sh
   ```

3. Make the script executable:
   ```bash
   chmod +x install-software-name.sh
   ```

4. Run the script:
   ```bash
   sudo ./install-software-name.sh
   ```

### Debian/Ubuntu
To install software on **Debian/Ubuntu**, follow these steps:

1. **Choose a script** from the list below for the software you want to install:
   - [Oracle VM VirtualBox](scripts/debian/install-virtualbox.sh)
   - [Docker](scripts/debian/install-docker.sh)
   - [Node.js](scripts/debian/install-nodejs.sh)
   - [VLC Media Player](scripts/debian/install-vlc.sh)

2. Download the installation script:
   ```bash
   curl -O https://raw.githubusercontent.com/your-repo/linux-install-scripts/debian/install-software-name.sh
   ```

3. Make the script executable:
   ```bash
   chmod +x install-software-name.sh
   ```

4. Run the script:
   ```bash
   sudo ./install-software-name.sh
   ```

## How It Works

- **System Update**: The script starts by updating your system to ensure you're working with the latest software packages and security updates.
- **Software Installation**: The script installs the specified software and any required dependencies (e.g., kernel headers for VirtualBox, or specific libraries for Docker).
- **Kernel Modules (if applicable)**: For software like VirtualBox, the script loads necessary kernel modules (`vboxdrv`).
- **Service Management**: For software that requires background services (e.g., Docker or VirtualBox), the script ensures they are enabled to start at boot using `systemctl`.

## Contributing

We welcome contributions! If you would like to help improve the scripts, add support for new software, or add support for additional Linux distributions, please fork this repository, make your changes, and create a pull request.

### Steps to Contribute

1. Fork the repository.
2. Clone your fork locally:
   ```bash
   git clone https://github.com/your-username/linux-install-scripts.git
   ```
3. Create a new branch for your changes:
   ```bash
   git checkout -b your-branch-name
   ```
4. Make your changes and commit them:
   ```bash
   git commit -m "Describe your changes"
   ```
5. Push your changes to your fork:
   ```bash
   git push origin your-branch-name
   ```
6. Open a pull request to the main repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Key Notes:

1. **Add Software**: As you expand this repository to include more software, you can create a new script for each software and its supported Linux distributions. Make sure to follow the same pattern to keep things organized.
2. **Update the URLs**: Replace the placeholder `install-software-name.sh` with the correct names of the scripts in your repository.
3. **Expanded Software List**: As you add more software, update the "Supported Software" section with a list of available software and their respective installation scripts.
4. **System-specific Instructions**: If any software requires specific installation steps for certain distributions, be sure to document those in the individual script files and the README.
