#!/bin/bash

# Set colors for better output readability
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
BLUE="\033[34m"
CYAN="\033[36m"
RESET="\033[0m"
BOLD="\033[1m"

# Display header with Figlet
echo -e "${CYAN}"
figlet "Dev Setup"
echo -e "${RESET}"

# Function to install a package with verbose output
install_package() {
    echo -e "${YELLOW}Installing ${BOLD}$1${RESET}..."
    sudo pacman -S --noconfirm --needed $1
}

# Function to check for a package and install it if missing
check_and_install() {
    if ! command -v $1 &> /dev/null; then
        install_package $2
    else
        echo -e "${GREEN}$1 is already installed.${RESET}"
    fi
}

# Function to install Python and dependencies
install_python() {
    check_and_install "python" "python"
    check_and_install "pip" "python-pip"
    echo -e "${YELLOW}Installing Python dependencies...${RESET}"
    pip install --upgrade pip
}

# Function to install GCC for C/C++
install_gcc() {
    check_and_install "gcc" "gcc"
    check_and_install "g++" "gcc"
}

# Function to install Clang for C/C++
install_clang() {
    check_and_install "clang" "clang"
}

# Function to install Node.js and npm
install_nodejs() {
    check_and_install "node" "nodejs"
    check_and_install "npm" "npm"
}

# Function to install Java (JDK)
install_java() {
    check_and_install "java" "jdk-openjdk"
}

# Function to install Flutter and Dart
install_flutter() {
    check_and_install "flutter" "flutter"
    check_and_install "dart" "dart"
}

# Function to install .NET SDK
install_dotnet() {
    check_and_install ".net" "dotnet-sdk"
}

# Function to install Go (Golang)
install_golang() {
    check_and_install "go" "go"
}

# Function to install Rust
install_rust() {
    check_and_install "rustc" "rustup"
    rustup update
}

# Function to install PHP
install_php() {
    check_and_install "php" "php"
}

# Function to install MariaDB
install_mariadb() {
    check_and_install "mariadb" "mariadb"
}

# Function to install Perl
install_perl() {
    check_and_install "perl" "perl"
}

# Function to display a menu for language installation choices
show_menu() {
    echo -e "${CYAN}Choose the programming languages and tools you want to install:${RESET}"
    echo -e "${GREEN}1. Python${RESET}"
    echo -e "${GREEN}2. C/C++ (GCC and Clang){RESET}"
    echo -e "${GREEN}3. Node.js & NPM${RESET}"
    echo -e "${GREEN}4. Java (JDK){RESET}"
    echo -e "${GREEN}5. Flutter & Dart${RESET}"
    echo -e "${GREEN}6. .NET SDK${RESET}"
    echo -e "${GREEN}7. Go (Golang){RESET}"
    echo -e "${GREEN}8. Rust${RESET}"
    echo -e "${GREEN}9. PHP${RESET}"
    echo -e "${GREEN}10. MariaDB${RESET}"
    echo -e "${GREEN}11. Perl${RESET}"
    echo -e "${YELLOW}12. Install All${RESET}"
    echo -e "${RED}13. Exit${RESET}"
    echo -e "${CYAN}Enter your choice (number): ${RESET}"
}

# Main function
while true; do
    show_menu
    read -p "Your choice: " choice

    case $choice in
        1)
            install_python
            ;;
        2)
            echo -e "${YELLOW}Which compiler would you like to install?${RESET}"
            echo -e "${CYAN}1. GCC${RESET}"
            echo -e "${CYAN}2. Clang${RESET}"
            read -p "Enter your choice (1 or 2): " compiler_choice
            case $compiler_choice in
                1) install_gcc ;;
                2) install_clang ;;
                *) echo -e "${RED}Invalid choice!${RESET}" ;;
            esac
            ;;
        3)
            install_nodejs
            ;;
        4)
            install_java
            ;;
        5)
            install_flutter
            ;;
        6)
            install_dotnet
            ;;
        7)
            install_golang
            ;;
        8)
            install_rust
            ;;
        9)
            install_php
            ;;
        10)
            install_mariadb
            ;;
        11)
            install_perl
            ;;
        12)
            install_python
            install_gcc
            install_clang
            install_nodejs
            install_java
            install_flutter
            install_dotnet
            install_golang
            install_rust
            install_php
            install_mariadb
            install_perl
            ;;
        13)
            echo -e "${GREEN}Exiting...${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice! Please choose a valid option.${RESET}"
            ;;
    esac
done

