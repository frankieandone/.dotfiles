#!/usr/bin/env zsh

source $DOTFILES/.core.sh

# preserves shell history, shell vars, knowledge of background jobs
hot_reload_shell() {
    source $HOME/.zshrc
}

rl() {
    hot_reload_shell
}
