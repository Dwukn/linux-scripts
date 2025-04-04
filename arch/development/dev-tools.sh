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
figlet "Dev Tools Setup"
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

# Function to install Git
install_git() {
    check_and_install "git" "git"
}

# Function to install AUR Helper (yay)
install_yay() {
    check_and_install "yay" "yay"
}

# Function to install Snap
install_snap() {
    check_and_install "snap" "snapd"
    sudo systemctl enable --now snapd.socket
}

# Function to install Flatpak
install_flatpak() {
    check_and_install "flatpak" "flatpak"
}

# Function to install Visual Studio Code
install_vscode() {
    check_and_install "code" "visual-studio-code-bin"
}

# Function to install JetBrains Toolbox
install_jetbrains() {
    check_and_install "jetbrains-toolbox" "jetbrains-toolbox"
}

# Function to install Docker
install_docker() {
    check_and_install "docker" "docker"
    sudo systemctl enable --now docker
}

# Function to install Postman
install_postman() {
    check_and_install "postman" "postman"
}

# Function to install Insomnia
install_insomnia() {
    check_and_install "insomnia" "insomnia"
}

# Function to install AWS CLI
install_aws_cli() {
    check_and_install "aws" "aws-cli"
}

# Function to install Kubernetes (kubectl)
install_kubectl() {
    check_and_install "kubectl" "kubectl"
}

# Function to install Minikube
install_minikube() {
    check_and_install "minikube" "minikube"
}

# Function to install htop
install_htop() {
    check_and_install "htop" "htop"
}

# Function to install Zsh-related utilities
install_zsh_utilities() {
    check_and_install "zsh-completions" "zsh-completions"
    check_and_install "zsh-autosuggestions" "zsh-autosuggestions"
    check_and_install "zsh-syntax-highlighting" "zsh-syntax-highlighting"
    check_and_install "fig" "fig"
}

# Function to install additional development tools (CMake, Make, etc.)
install_build_tools() {
    check_and_install "base-devel" "base-devel"
    check_and_install "cmake" "cmake"
    check_and_install "make" "make"
}

# Function to install Docker Compose
install_docker_compose() {
    check_and_install "docker-compose" "docker-compose"
}

# Function to install Nerd Fonts
install_nerd_fonts() {
    check_and_install "nerd-fonts-complete" "nerd-fonts-complete"
}

# Function to install Node.js and NPM
install_nodejs() {
    check_and_install "node" "nodejs"
    check_and_install "npm" "npm"
}

# Function to install Java (JDK)
install_java() {
    check_and_install "java" "jdk-openjdk"
}

# Function to install Go (Golang)
install_golang() {
    check_and_install "go" "go"
}

# Function to install Python and pip
install_python() {
    check_and_install "python" "python"
    check_and_install "pip" "python-pip"
}

# Function to install MariaDB
install_mariadb() {
    check_and_install "mariadb" "mariadb"
}

# Function to install PostgreSQL
install_postgresql() {
    check_and_install "postgresql" "postgresql"
}

# Function to install Redis
install_redis() {
    check_and_install "redis" "redis"
}

# Function to display a menu for tool installation choices
show_menu() {
    echo -e "${CYAN}Choose the development tools and utilities you want to install:${RESET}"
    echo -e "${GREEN}1. Git${RESET}"
    echo -e "${GREEN}2. AUR Helper (yay){RESET}"
    echo -e "${GREEN}3. Snap${RESET}"
    echo -e "${GREEN}4. Flatpak${RESET}"
    echo -e "${GREEN}5. Visual Studio Code${RESET}"
    echo -e "${GREEN}6. JetBrains Toolbox${RESET}"
    echo -e "${GREEN}7. Docker${RESET}"
    echo -e "${GREEN}8. Postman${RESET}"
    echo -e "${GREEN}9. Insomnia${RESET}"
    echo -e "${GREEN}10. AWS CLI${RESET}"
    echo -e "${GREEN}11. Kubernetes (kubectl){RESET}"
    echo -e "${GREEN}12. Minikube${RESET}"
    echo -e "${GREEN}13. htop${RESET}"
    echo -e "${GREEN}14. Zsh utilities (autosuggestions, syntax highlighting, etc.){RESET}"
    echo -e "${GREEN}15. Development tools (CMake, Make, etc.){RESET}"
    echo -e "${GREEN}16. Docker Compose${RESET}"
    echo -e "${GREEN}17. Nerd Fonts${RESET}"
    echo -e "${GREEN}18. Node.js & NPM${RESET}"
    echo -e "${GREEN}19. Java (JDK){RESET}"
    echo -e "${GREEN}20. Go (Golang){RESET}"
    echo -e "${GREEN}21. Python & pip${RESET}"
    echo -e "${GREEN}22. MariaDB${RESET}"
    echo -e "${GREEN}23. PostgreSQL${RESET}"
    echo -e "${GREEN}24. Redis${RESET}"
    echo -e "${YELLOW}25. Install All${RESET}"
    echo -e "${RED}26. Exit${RESET}"
    echo -e "${CYAN}Enter your choice (number): ${RESET}"
}

# Main function
while true; do
    show_menu
    read -p "Your choice: " choice

    case $choice in
        1) install_git ;;
        2) install_yay ;;
        3) install_snap ;;
        4) install_flatpak ;;
        5) install_vscode ;;
        6) install_jetbrains ;;
        7) install_docker ;;
        8) install_postman ;;
        9) install_insomnia ;;
        10) install_aws_cli ;;
        11) install_kubectl ;;
        12) install_minikube ;;
        13) install_htop ;;
        14) install_zsh_utilities ;;
        15) install_build_tools ;;
        16) install_docker_compose ;;
        17) install_nerd_fonts ;;
        18) install_nodejs ;;
        19) install_java ;;
        20) install_golang ;;
        21) install_python ;;
        22) install_mariadb ;;
        23) install_postgresql ;;
        24) install_redis ;;
        25)
            # Install everything
            install_git
            install_yay
            install_snap
            install_flatpak
            install_vscode
            install_jetbrains
            install_docker
            install_postman
            install_insomnia
            install_aws_cli
            install_kubectl
            install_minikube
            install_htop
            install_zsh_utilities
            install_build_tools
            install_docker_compose
            install_nerd_fonts
            install_nodejs
            install_java
            install_golang
            install_python
            install_mariadb
            install_postgresql
            install_redis
            ;;
        26)
            echo -e "${GREEN}Exiting...${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice! Please choose a valid option.${RESET}"
            ;;
    esac
done

