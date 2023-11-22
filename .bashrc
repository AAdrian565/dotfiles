#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -f $HOME/.bashrc_aliases ]; then
    . $HOME/.bashrc_aliases
fi

# NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin/
export PATH=$PATH:/opt/flutter/bin

# neofetch
export BROWSER=thorium-browser
export BROWSE=thorium-browser
export EDITOR=nvim
export VISUAL=nvim
export GDK_BACKEND="wayland"
export GTK_USE_PORTAL=1
export MOZ_ENABLE_WAYLAND=1
eval "$(starship init bash)"
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

isolate() {
    if [ -z "$1" ]; then
        echo "Usage: isolate <app_name>"
        return 1
    fi
    $1 & disown
}
