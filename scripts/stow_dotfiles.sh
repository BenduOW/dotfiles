#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"

# Check if the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory not found"
    exit 1
fi

echo "Stowing dotfiles..."
mv $HOME/.bashrc $HOME/.bashrc.bak

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
