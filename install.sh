#!/bin/sh

echo "Installing..."

DOTFILES=$HOME/.dotfiles

rm -rf $HOME/.oh-my-zsh.backup
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.backup

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

if [ ! -d $DOTFILES ]; then
    git clone --recurse-submodules --depth=1 git@github.com:frankieandone/.dotfiles.git $DOTFILES
fi

cp $DOTFILES/lib/themes/daivasmara.zsh-theme $HOME/.oh-my-zsh/themes/daivasmara.zsh-theme

rm $HOME/.zshrc
cp $DOTFILES/.zshenv.template.sh $HOME/.zshenv
cp $DOTFILES/.zshrc.template.sh $HOME/.zshrc

chsh -s $(which zsh)

if [ ! -d $DOTFILES ]; then
    git clone --recurse-submodules --depth=1 git@github.com:frankieandone/.dotfiles.git $DOTFILES
fi

cp $DOTFILES/lib/themes/daivasmara.zsh-theme $HOME/.oh-my-zsh/themes/daivasmara.zsh-theme

rm $HOME/.zshrc
cp -f $DOTFILES/.zshenv.template.sh $HOME/.zshenv && cp -f $DOTFILES/.zshrc.template.sh $HOME/.zshrc

chsh -s $(which zsh)
