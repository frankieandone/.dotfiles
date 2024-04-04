#!/usr/bin/env zsh

source $HOME/.dotfiles/.core.sh

# preserves shell history, shell vars, knowledge of background jobs
hot_reload_shell() {
    source $HOME/.zshrc
}
