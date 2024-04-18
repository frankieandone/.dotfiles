sh -c "$(curl -fsSL https://raw.githubusercontent.com/frankieandone/.dotfiles/main/init.sh)" --unattended

chmod +x ./init.sh

./init.sh

chsh -s /bin/zsh
