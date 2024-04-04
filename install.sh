#!/bin/sh

echo "Installing..."

rm -rf $HOME/.oh-my-zsh.backup
mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.backup

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

if [ ! -d $HOME/.dotfiles ]; then
    git clone --depth=1 git@github.com:frankieandone/.dotfiles.git $HOME/.dotfiles
fi

if [ ! -f $HOME/.dotfiles/themes/daivasmara.zsh-theme ]; then
    # daivasmara.zsh-theme
    git clone --depth=1 git@github.com:frankieandone/daivasmara.zsh-theme.git $HOME/.dotfiles/themes
fi

cp $HOME/.dotfiles/themes/daivasmara.zsh-theme $HOME/.oh-my-zsh/themes/daivasmara.zsh-theme

rm $HOME/.zshrc
cp $HOME/.dotfiles/.zshenv.template.sh $HOME/.zshenv
cp $HOME/.dotfiles/.zshrc.template.sh $HOME/.zshrc

chsh -s $(which zsh)
