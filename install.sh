#!/bin/zsh -x
exec &>$HOME/Downloads/install.sh.log

mkdir -p $HOME/.dotfiles
dotfiles_path=$HOME/.dotfiles

#prints to stderr
echo_err() { printf "%s\n" "$*" >&2; }

k_install_path=$HOME/.k
git clone 'git@github.com:frankieandone/k.git' $k_install_path \
  && chmod +x $k_install_path/k.sh \
  && ln -sf $k_install_path/k.sh $dotfiles_path/k.sh \
  && echo >> 'source "$dotfiles_path"/k.s"' \
  && $dotfiles_path/k.sh --no-vcs || echo_err "failed to install k.sh"

#fnm: fast node manager built on rust
install_fnm() {
  brew install fnm
}

exec zsh
