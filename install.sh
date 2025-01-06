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
        #opensuse)
        #    installcom="sudo zypper install -y"
        #    ;;
        *)
            echo "Unsupported Distro: $DISTRO"
            exit 1
            ;;
    esac
}

if lspci | grep -i nvidia; then
    echo "NVIDIA GPU detected."
    
    echo "Would you like to install NVIDIA drivers and utilities? (yes/no)"
    read answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
        echo "Installing NVIDIA packages..."
        $installcom nvidia nvidia-utils
        echo "NVIDIA packages installed."
    else
        echo "You chose not to install the NVIDIA packages."
    fi
else
    echo "No NVIDIA GPU detected."
    echo "Proceeding with the rest of the script."
fi

echo "Script continues..."
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
echo "4. Install Discord via Flatpak"
echo "5. Install FiraCode Nerd Font"
echo "6. Stow dotfiles"
echo "7. Install tmux plugins"
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
            echo "Installing Discord via Flatpak..."
            $installcom flatpak
            flatpak install flathub com.discordapp.Discord -y
            flatpak install flathub flatseal -y
            ;;
        5)
            source $HOME/dotfiles/scripts/install_fira_font.sh
            ;;
        6)
            source $HOME/dotfiles/scripts/stow_dotfiles.sh
            ;;
        7)
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
            ;;
        8)
            echo "Skipping all tasks."
            ;;
        *)
            echo "Invalid choice: $choice"
            ;;
    esac
done

echo "Script completed successfully!"