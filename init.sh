#!/bin/sh

DOTFILES="$HOME/.dotfiles"
ZSH_DOTFILES=$DOTFILES/zsh

if [ -d $DOTFILES ]; then
    echo '$DOTFILES is already installed.'
    read -p 'Do you want to overwrite it? (yes/no): ' overwrite_response
    case "$overwrite_response" in
    [Yy][Ee][Ss])
        git reset --hard origin/main
        if ! git pull origin main; then
            echo 'Merge conflict detected. Resolving conflicts in favor of incoming changes.'
            git reset --hard origin/main
        fi
        git submodule update --recursive --remote --merge
        ;;
    *)
        echo 'Skipping $DOTFILES installation.'
        ;;
    esac
else
    git clone --recurse-submodules --depth=1 git@github.com:frankieandone/.dotfiles.git $DOTFILES
fi

ln -sfv $ZSH_DOTFILES/.proto.zshenv.zsh $HOME/.zshenv
ln -sfv $ZSH_DOTFILES/.proto.zshrc.zsh $HOME/.zshrc
