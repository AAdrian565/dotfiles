
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.bashrc_aliases

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.config/emacs/bin
export PATH=$PATH:~/.pub-cache/bin
export PATH=$PATH:~/.npm-packages/bin
export PATH=$PATH:~/go/bin/
export PATH=$PATH:~/script/
export PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin/

export DISPLAY=:0.0
export TERM=kitty
export BROWSER=thorium-browser
export EDITOR=nvim
export VISUAL=nvim

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

eval "$(starship init bash)"
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
