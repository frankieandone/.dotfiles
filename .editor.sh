#!/usr/bin/env zsh

if command -v nvim &> /dev/null; then
    export EDITOR=nvim
    alias vim=nvim
fi

if command -v code &> /dev/null; then
    alias zshconfig=code $DOTFILES
    alias vimconfig=code $HOME/.config/nvim
fi
