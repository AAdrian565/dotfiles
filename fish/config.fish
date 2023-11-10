set -g fish_greeting

alias rmi="rm -i"
set TERM "xterm-256color"
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

export BROWSER=thorium-browser
export EDITOR=nvim
export VISUAL=nvim
export GDK_BACKEND="wayland"
export GTK_USE_PORTAL=1
export MOZ_ENABLE_WAYLAND=1

starship init fish | source

. $HOME/.bashrc_aliases
