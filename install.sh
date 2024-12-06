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

# Main Menu: Choose installation options
echo "Select your preferred option:"
echo "1. Install basic (DE)"
echo "2. Install DWM"
echo "3. Install Hyprland"
echo "4. Install Uni-Stuff"
echo "5. Skip program installation"
read -p "Enter choice (1-5) seperated by space: " -a choices

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
            echo "Skipping program installation..."
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac
done

#Discord Installation
while true; do
    read -p "Do you want to install Discord using Flatpak? (y/n): " discord_choice
    case $discord_choice in
        [Yy]*)
            $installcom flatpak
            flatpak install flathub com.discordapp.Discord -y
            flatpak install flathub flatseal -y
            break
            ;;
        [Nn]*)
            echo "Skipping Discord installation..."
            break
            ;;
        *)
            echo "Invalid input. Please enter 'y' or 'n'."
            ;;
    esac
done

# Font Installation
while true; do
    read -p "Do you want to install the FiraCode Nerd Font? (y/n): " font_choice
    case $font_choice in
        [Yy]*)
            FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
            FONT_DIR="$HOME/.local/share/fonts"

            # Create the font directory if it doesn't exist
            mkdir -p "$FONT_DIR"

            echo "Downloading Fira Code Nerd Font..."
            curl -L -o "$HOME/FiraCode.zip" "$FONT_URL"

            if [ ! -f "$HOME/FiraCode.zip" ]; then
                echo "Error: Failed to download Fira Code Nerd Font."
                exit 1
            fi

            echo "Extracting fonts..."
            unzip -o "$HOME/FiraCode.zip" -d "$FONT_DIR"

            echo "Updating font cache..."
            fc-cache -fv

            echo "Cleaning up..."
            rm "$HOME/FiraCode.zip"
            rm "$HOME/.local/share/fonts/LICENSE"
            rm "$HOME/.local/share/fonts/README.md"
            echo "Fira Code Nerd Font installation complete!"
            break
            ;;
        [Nn]*)
            echo "Skipping font installation..."
            break
            ;;
        *)
            echo "Invalid input. Please enter 'y' or 'n'."
            ;;
    esac
done

#stowing dotfiles
while true; do
    read -p "Do you want to stow dotfiles? (y/n): " stow_choice
    case $stow_choice in
        [Yy]*)
            mv $HOME/.bashrc $HOME/.bashrc.bak
            echo "Stowing dotfiles..."

            stow -d "$DOTFILES_DIR" -t "$HOME" .vscode

            for dir in "$DOTFILES_DIR"/*/; do
                if [ ! -d "$dir" ]; then
                    continue
                fi

                folder_name=$(basename "$dir")
                if [ "$folder_name" == "useful" ] || [ "$folder_name" == "scripts" ]; then
                    echo "Skipping folder $folder_name"
                    continue
                fi

                echo "Stowing $folder_name..."
                stow -d "$DOTFILES_DIR" -t "$HOME" "$folder_name"
            done

            echo "All folders are stowed."
            break
            ;;
        [Nn]*)
            echo "Skipping dotfiles stowing..."
            break
            ;;
        *)
            echo "Invalid input. Please enter 'y' or 'n'."
            ;;
    esac
done

#Sourcing .bashrc
source $HOME/.bashrc
echo "Script completed successfully!"
