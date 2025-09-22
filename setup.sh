#!/bin/bash

# Dotfiles Setup Script
# Automatically detects shell and configures dotfiles using GNU Stow
set -e # Exit on any error

check_stow() {
    if ! command -v stow &> /dev/null; then
        echo -e "\033[0;31m[ERROR]\033[0m GNU Stow is not installed!"
        echo "Install it:"
        echo "  brew install stow # (macOS)"
        echo "  sudo apt install stow # (Ubuntu/Debian)"
        exit 1
    fi
}

stow_configs() {
    echo "Creating symlinks for all configurations..."
    for d in */; do
        [[ "$d" == ".git/" || "$d" == ".github/" || "$d" == "docs/" ]] && continue
        dir_name="${d%/}"
        if stow "$dir_name" 2>/dev/null; then
            echo "Stowed ${dir_name}"
        else
            echo "Failed to stow ${dir_name}"
        fi
    done
}

make_scripts_executable() {
    echo "Making scripts executable..."
    if [[ -d "$HOME/bash/scripts" ]]; then
        for file in "$HOME"/bash/scripts/*; do
            [[ -f "$file" ]] && sudo chmod +x "$file" && echo "Made executable: $(basename "$file")"
        done
    else
        echo "bash/scripts directory not found, skipping."
    fi
}

get_shell_config() {
    case "${SHELL##*/}" in
        bash) echo "$HOME/.bashrc" ;;
        zsh) echo "$HOME/.zshrc" ;;
        fish) echo "$HOME/.config/fish/config.fish" ;;
        *) echo "" ;;
    esac
}

configure_shell() {
    local config_file=$(get_shell_config)
    if [[ -z "$config_file" ]]; then
        echo "Unknown shell. Please, configure exports manually"
        return
    fi
    mkdir -p "$(dirname "$config_file")"
    
    # Remove previous dotfiles configuration if exists
    if [[ -f "$config_file" ]] && grep -Fq "# BEGIN DOTFILES CONFIG" "$config_file"; then
        # Create temp file without the dotfiles section
        sed '/# BEGIN DOTFILES CONFIG/,/# END DOTFILES CONFIG/d' "$config_file" > "${config_file}.tmp"
        mv "${config_file}.tmp" "$config_file"
    fi
    
    cat >> "$config_file" << 'EOF'

# BEGIN DOTFILES CONFIG
# This section is auto-managed by dotfiles setup script
if [ -d "$HOME/bash" ]; then
    for file in "$HOME/bash"/*.sh; do
        [ -f "$file" ] && source "$file"
    done
fi
export PATH="$HOME/bash/scripts/:$PATH"
# END DOTFILES CONFIG
EOF
    echo "${config_file} updated"
}

main() {
    [[ ! -f "setup.sh" ]] && { echo -e "\033[0;31m[ERROR]\033[0m Run from dotfiles directory"; exit 1; }

    check_stow
    stow_configs
    make_scripts_executable
    configure_shell
    echo -e "\033[0;32m☑️ Dotfiles setup completed!\033[0m Restart your terminal to apply changes"
}

main "$@"