#!/bin/sh
# Installation/Rollback script for lfub and lf previews on another device (assumes GNU Stow is used)

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Determine directories
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Check if rollback is requested
if [ "$1" = "rollback" ] || [ "$1" = "--rollback" ]; then
    printf "${BLUE}==> Initiating rollback of lf wrapper swap...${NC}\n"
    
    LF_PATH=$(which lf 2>/dev/null || true)
    
    # Check standard local bin path if not found in current PATH
    if [ -z "$LF_PATH" ] && [ -f "$HOME/.local/bin/lf.bak" ]; then
        LF_PATH="$HOME/.local/bin/lf"
    fi
    
    if [ -z "$LF_PATH" ]; then
        printf "${RED}Error: Could not locate 'lf' executable directory.${NC}\n"
        exit 1
    fi
    
    LF_DIR=$(dirname "$LF_PATH")
    BAK_PATH="$LF_DIR/lf.bak"
    
    if [ ! -f "$BAK_PATH" ]; then
        printf "${RED}Error: Backup file '$BAK_PATH' does not exist. Nothing to roll back.${NC}\n"
        exit 1
    fi
    
    printf "Are you sure you want to restore the original binary from $BAK_PATH? [y/N]: "
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            ;;
        *)
            printf "${YELLOW}Rollback aborted.${NC}\n"
            exit 0
            ;;
    esac
    
    printf "${BLUE}==> Restoring original lf binary...${NC}\n"
    if [ -w "$LF_DIR" ]; then
        mv -f "$BAK_PATH" "$LF_PATH"
    else
        printf "${YELLOW}Write permission denied for $LF_DIR. Using sudo...${NC}\n"
        sudo mv -f "$BAK_PATH" "$LF_PATH"
    fi
    
    printf "${GREEN}✔ Successfully restored original lf binary to $LF_PATH${NC}\n"
    exit 0
fi

# Standard Installation flow
printf "${BLUE}==> Setting up lfub wrapper swap and checking permissions...${NC}\n"

# 1. Ensure preview scripts in the repo are executable (since Stow symlinks them)
printf "${BLUE}==> Making configuration scripts executable...${NC}\n"
chmod +x "$DOTFILES_DIR/.config/lf/preview"
chmod +x "$DOTFILES_DIR/.config/lf/cleaner"
printf "${GREEN}✔ Marked preview and cleaner scripts as executable in the repository${NC}\n"

# 2. Check dependencies first
printf "\n${BLUE}==> Checking optional dependencies...${NC}\n"

check_dep() {
    if command -v "$1" >/dev/null 2>&1; then
        printf "  [${GREEN}installed${NC}] %s - %s\n" "$1" "$2"
    else
        printf "  [${RED}missing  ${NC}] %s - %s\n" "$1" "$2"
    fi
}

check_dep_lf() {
    if command -v lf >/dev/null 2>&1 || command -v lf.bak >/dev/null 2>&1; then
        printf "  [${GREEN}installed${NC}] lf - Original lf binary (required)\n"
    else
        printf "  [${RED}missing  ${NC}] lf - Original lf binary (required)\n"
    fi
}

check_dep_lf
check_dep "ueberzug" "Image previews on X11"
check_dep "bat" "Syntax highlighting for code/text previews"
check_dep "chafa" "Image previews on Wayland / fallback"
check_dep "glow" "Markdown previews"
check_dep "ffmpegthumbnailer" "Video previews"
check_dep "pdftoppm" "PDF previews"
printf "\n"

# 3. Swap lf binary with wrapper script
LF_PATH=$(which lf 2>/dev/null || true)

# If lf is not found in PATH, but lf.bak exists, we can still proceed (it's already swapped)
if [ -z "$LF_PATH" ] && [ -f "$HOME/.local/bin/lf.bak" ]; then
    LF_PATH="$HOME/.local/bin/lf"
fi

if [ -z "$LF_PATH" ]; then
    printf "${RED}Error: lf is not installed. Please install lf first.${NC}\n"
    exit 1
fi

LF_DIR=$(dirname "$LF_PATH")
printf "${BLUE}==> Found lf at $LF_PATH${NC}\n"

printf "Do you want to swap the 'lf' binary with the wrapper script? [y/N]: "
read -r response
case "$response" in
    [yY][eE][sS]|[yY])
        ;;
    *)
        printf "${YELLOW}Aborting swap.${NC}\n"
        exit 0
        ;;
esac

if [ -f "$LF_DIR/lf.bak" ]; then
    printf "${YELLOW}⚠ lf.bak already exists in $LF_DIR. Skipping backup.${NC}\n"
else
    printf "${BLUE}==> Backing up real lf binary to $LF_DIR/lf.bak...${NC}\n"
    if [ -w "$LF_DIR" ]; then
        mv "$LF_PATH" "$LF_DIR/lf.bak"
    else
        printf "${YELLOW}Write permission denied for $LF_DIR. Using sudo...${NC}\n"
        sudo mv "$LF_PATH" "$LF_DIR/lf.bak"
    fi
    printf "${GREEN}✔ Backed up binary to $LF_DIR/lf.bak${NC}\n"
fi

printf "${BLUE}==> Replacing lf with the wrapper script...${NC}\n"
if [ -w "$LF_DIR" ]; then
    cp "$DOTFILES_DIR/script/lfub" "$LF_PATH"
    chmod +x "$LF_PATH"
else
    sudo cp "$DOTFILES_DIR/script/lfub" "$LF_PATH"
    sudo chmod +x "$LF_PATH"
fi
printf "${GREEN}✔ Installed wrapper script directly as $LF_PATH${NC}\n"

# 4. Clean up any existing shell aliases for lf
SHELL_CONFIGS="$HOME/.bashrc_aliases $HOME/.bashrc $HOME/.zshrc"
for config in $SHELL_CONFIGS; do
    if [ -f "$config" ] && grep -q "alias lf=" "$config"; then
        printf "${BLUE}==> Cleaning up old lf alias from $config...${NC}\n"
        # Create temp file to avoid inplace edit issues
        tmp_file=$(mktemp)
        grep -v "alias lf=" "$config" > "$tmp_file" || true
        # Also clean up the comment above it if present
        grep -v "# lf wrapper for ueberzug image previews" "$tmp_file" > "$config" || true
        rm "$tmp_file"
        printf "${GREEN}✔ Removed alias from $config${NC}\n"
    fi
done

printf "\n${GREEN}✔ Swap and setup completed successfully!${NC}\n"
