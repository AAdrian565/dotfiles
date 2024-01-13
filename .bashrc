#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.bashrc_aliases

# NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/go/bin/
export PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin/
export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:~/.config/emacs/bin
export PATH=$PATH:"$HOME/.pub-cache/bin"

# export DISPLAY=:0.0
export TERM=TERM=xterm-256color
export TERMINAL=kitty
export BROWSER=thorium-browser
export BROWSE=thorium-browser
export EDITOR=nvim
export VISUAL=nvim
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
