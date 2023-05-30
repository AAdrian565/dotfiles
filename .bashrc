#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -f $HOME/.bashrc_aliases ]; then
    . $HOME/.bashrc_aliases
fi

# neofetch
export EDITOR=nvim
export VISUAL=nvim
export GDK_BACKEND="wayland"
export GTK_USE_PORTAL=1
export MOZ_ENABLE_WAYLAND=1
eval "$(starship init bash)"
PS1='[\u@\h \W]\$ '
