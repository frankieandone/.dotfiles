#!/usr/bin/env zsh

autoload -Uz compinit && compinit -C;

DISABLE_MAGIC_FUNCTIONS=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

zstyle ':omz:plugins:*' aliases no
zstyle ':omz:plugins:git' aliases yes
zstyle ':omz:update' mode disabled
zstyle ':omz:update' verbose silent

ZSH_THEME=robbyrussell
plugins=( git ssh-agent history )

source $HOME/.oh-my-zsh/oh-my-zsh.sh
