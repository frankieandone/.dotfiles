#!/usr/bin/env zsh

if command -v nvim &> /dev/null; then
    export EDITOR=nvim
    alias vim=nvim
fi

if command -v code &> /dev/null; then
    alias zshconfig=code $HOME/.dotfiles
    alias vimconfig=code $HOME/.config/nvim
fi
