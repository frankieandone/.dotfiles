#!/bin/bash

DOTFILES=$HOME/.dotfiles

if [ -d $DOTFILES ]; then
    echo "$DOTFILES is already installed."
    read -p 'Do you want to overwrite it? (yes/no): ' overwrite_response
    case "$overwrite_response" in
    [Yy][Ee][Ss])
        git reset --hard origin/main
        if ! git pull origin main; then
            echo "Merge conflict detected. Resolving conflicts in favor of incoming changes."
            git reset --hard origin/main
        fi
        git submodule update --recursive --remote --merge
        ;;
    *)
        echo "Skipping $DOTFILES installation."
        ;;
    esac
else
    git clone --recurse-submodules --depth=1 git@github.com:frankieandone/.dotfiles.git $DOTFILES
fi

cp -fv $DOTFILES/.proto.zshenv.sh $HOME/.zshenv
cp -fv $DOTFILES/.proto.zshrc.sh $HOME/.zshrc
cp -fv $DOTFILES/.proto.zlogin.sh $HOME/.zlogin

cp -fv "$DOTFILES/lib/themes/daivasmara.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/daivasmara.zsh-theme"
