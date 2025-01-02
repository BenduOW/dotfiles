#!/bin/sh

# Log file location
LOG_FILE="$HOME/dotfiles/install.log"

# Function to log with timestamp
log_with_timestamp() {
    # Check if we are on the 'git_testing' branch
    current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ "$current_branch" = "git_testing" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
    fi
}
