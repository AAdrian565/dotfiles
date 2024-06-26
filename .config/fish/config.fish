set -g fish_greeting

alias rmi="rm -i"
set TERM "kitty"
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

bind \cH backward-kill-word
bind \ca execute 'tmux a'

fish_add_path -g /opt/flutter/bin/
fish_add_path -g ~/Android/Sdk/cmdline-tools/latest/bin/
fish_add_path -g ~/Android/Sdk/emulator/
fish_add_path -g ~/go/bin
fish_add_path -g ~/.local/bin/
fish_add_path -g ~/.npm-packages/bin
fish_add_path -g ~/.config/emacs/bin
fish_add_path -g ~/.pub-cache/bin

export BROWSER=thorium-browser
export BROWSE=thorium-browser
export EDITOR=nvim
export VISUAL=nvim
# export GDK_BACKEND="wayland"
# export GTK_USE_PORTAL=1
# export MOZ_ENABLE_WAYLAND=1
export TERM=xterm-256color
export TERMINAL=kitty

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

starship init fish | source

. $HOME/.bashrc_aliases
. $HOME/.bashrc_env

function isolate
    if test -z $argv[1]
        echo "Usage: isolate <app_name>"
        return 1
    end

    $argv[1] &; disown;
end
