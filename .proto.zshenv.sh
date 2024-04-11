#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

if [ -z $DOTFILES_ENV_LOADED ]; then
    source $DOTFILES/.env.sh
    source $DOTFILES/.aliases.sh
    
    if [ -f $HOME/.env ]; then
        source $HOME/.env
    fi
    
    export DOTFILES_ENV_LOADED=1
fi
