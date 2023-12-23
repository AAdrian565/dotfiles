set -g fish_greeting

alias rmi="rm -i"
set TERM "kitty"
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

bind \cH backward-kill-word

fish_add_path -g ~/.local/bin/
fish_add_path -g ~/Android/Sdk/cmdline-tools/latest/bin/
fish_add_path -g ~/Android/Sdk/emulator/
fish_add_path -g /opt/flutter/bin/
fish_add_path -g ~/.config/emacs/bin
fish_add_path -g ~/.pub-cache/bin
fish_add_path -g ~/go/bin


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
fish_add_path /home/adrian/.spicetify
