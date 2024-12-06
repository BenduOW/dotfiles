#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory not found"
    exit 1
fi

source $HOME/dotfiles/scripts/logging.sh

# Function to detect package manager
detect_package_manager() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo "Cannot determine Linux Distro"
        exit 1
    fi

    case $DISTRO in
        ubuntu|debian)
            installcom="sudo apt update && sudo apt install -y"
            ;;
        fedora|centos|rhel)
            installcom="sudo dnf install -y"
            ;;
        arch)
            installcom="sudo pacman -Sy --noconfirm"
            ;;
        opensuse)
            installcom="sudo zypper install -y"
            ;;
        *)
            echo "Unsupported Distro: $DISTRO"
            exit 1
            ;;
    esac
}

# Function to install programs from the list
install_programs() {
    programs=$1
    echo "Installing $programs..."
    $installcom $programs
}

# Detect package manager
detect_package_manager

# Main Menu: Select tasks to perform
echo "Select the tasks you want to perform (separate choices with space):"
echo "1. Install basic (DE)"
echo "2. Install DWM"
echo "3. Install Hyprland"
echo "4. Install Uni-Stuff"
echo "5. Install Discord via Flatpak"
echo "6. Install FiraCode Nerd Font"
echo "7. Stow dotfiles"
echo "8. Skip all tasks"

read -p "Enter your choices (1-8): " -a choices

# Install programs based on user selection
for choice in "${choices[@]}"; do
    case $choice in
        1)
            install_programs "$(< programs_basic.list)"
            ;;
        2)
            install_programs "$(< programs_dwm.list)"
            ;;
        3)
            install_programs "$(< programs_hyprland.list)"
            ;;
        4)
            install_programs "$(< programs_uni.list)"
            ;;
        5)
            echo "Installing Discord via Flatpak..."
            $installcom flatpak
            flatpak install flathub com.discordapp.Discord -y
            flatpak install flathub flatseal -y
            ;;
        6)
            ./$HOME/dotfiles/scripts/install_fira_font.sh
            ;;
        7)
            ./$HOME/dotfiles/scripts/stow_dotfiles.sh
            ;;
        8)
            echo "Skipping all tasks."
            ;;
        *)
            echo "Invalid choice: $choice"
            ;;
    esac
done

source $HOME/.bashrc
echo "Script completed successfully!"

