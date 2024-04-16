#!/usr/bin/env zsh

if command -v nvim &>/dev/null; then
    EDITOR=nvim
    alias vim=nvim
fi

if command -v code &>/dev/null; then
    alias zshconfig="code -n $DOTFILES"
    alias vimconfig="code -n $HOME/.config/nvim"
fi

if [ -f /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea ]; then
    alias idea='/Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea'
fi
