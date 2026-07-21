#!/bin/sh
# Installation script for lfub and lf previews on another device (assumes GNU Stow is used)

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}==> Setting up lfub and checking permissions...${NC}"

# Determine directories
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOCAL_BIN_DEST="$HOME/.local/bin"

# 1. Ensure preview scripts in the repo are executable (since Stow symlinks them)
echo -e "${BLUE}==> Making configuration scripts executable...${NC}"
chmod +x "$DOTFILES_DIR/.config/lf/preview"
chmod +x "$DOTFILES_DIR/.config/lf/cleaner"
echo -e "${GREEN}✔ Marked preview and cleaner scripts as executable in the repository${NC}"

# 2. Install the lfub wrapper script
echo -e "${BLUE}==> Installing lfub wrapper script to $LOCAL_BIN_DEST...${NC}"
mkdir -p "$LOCAL_BIN_DEST"
cp -v "$DOTFILES_DIR/script/lfub" "$LOCAL_BIN_DEST/lfub"
chmod +x "$LOCAL_BIN_DEST/lfub"
echo -e "${GREEN}✔ lfub wrapper installed to $LOCAL_BIN_DEST/lfub${NC}"

# 3. Add alias to shell config
ALIAS_CMD="alias lf=\"lfub\""
SHELL_CONFIG=""

if [ -f "$HOME/.bashrc_aliases" ]; then
    SHELL_CONFIG="$HOME/.bashrc_aliases"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

if [ -n "$SHELL_CONFIG" ]; then
    if grep -q "alias lf=" "$SHELL_CONFIG"; then
        echo -e "${YELLOW}⚠ An alias for 'lf' already exists in $SHELL_CONFIG. Skipping alias addition.${NC}"
    else
        echo "" >> "$SHELL_CONFIG"
        echo "# lf wrapper for ueberzug image previews" >> "$SHELL_CONFIG"
        echo "$ALIAS_CMD" >> "$SHELL_CONFIG"
        echo -e "${GREEN}✔ Added 'lf' alias to $SHELL_CONFIG${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Could not find a shell config file (.bashrc, .bashrc_aliases, .zshrc) to add the alias automatically.${NC}"
    echo -e "Please add the following line manually to your shell configuration file:"
    echo -e "    ${BLUE}alias lf=\"lfub\"${NC}"
fi

# 4. Check dependencies
echo -e "\n${BLUE}==> Checking optional dependencies...${NC}"

check_dep() {
    if command -v "$1" >/dev/null 2>&1; then
        echo -e "  [${GREEN}installed${NC}] $1 - $2"
    else
        echo -e "  [${RED}missing  ${NC}] $1 - $2"
    fi
}

check_dep "lf" "Terminal file manager (required)"
check_dep "ueberzug" "Image previews on X11"
check_dep "bat" "Syntax highlighting for code/text previews"
check_dep "chafa" "Image previews on Wayland / fallback"
check_dep "glow" "Markdown previews"
check_dep "ffmpegthumbnailer" "Video previews"
check_dep "pdftoppm" "PDF previews"

echo -e "\n${GREEN}✔ Setup completed! (Make sure to run 'stow .' from the dotfiles directory if you haven't already).${NC}"
