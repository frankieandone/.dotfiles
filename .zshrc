export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/Library/Python/3.8/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.npm-packages/bin


export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE=true
ENABLE_CORRECTION=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

plugins=(
  git
  git-auto-fetch
  ssh-agent
  colored-man-pages
)

# User configuration

# IMPORTANT: source $ZSH/oh-my-zsh.sh after loading plugins
source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR="lvim"

# ---- START OF INSTALL SCRIPT -----

# xcode-select --install
# sudo xcodebuild -license accept

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo `$(which brew) shellenv` > ~/.zprofile
eval ~/.zprofile > /dev/null 2>&1
# brew install zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s $(which zsh)

# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# brew install zsh-navigation-tools
source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

# brew install zsh-you-should-use
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh

# brew install zsh-git-prompt
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh

# brew install keychain
# mkdir -p ~/.ssh
# -K, -A is deprecated, use --apple-use-keychain, --apple-load-keychain respectively
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 -q
ssh-add -l

# brew install neovim
export NPM_HOME="$(which npm)"

# ---- END OF INSTALL SCRIPT -----

alias ls='ls -aGlLp'
alias vim="lvim"
alias nvim="lvim"
alias zshconfig='lvim ~/.zshrc'
alias vimconfig='code ~/.local/share/lunarvim'
export XDG_CONFIG_HOME="~/.config"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
alias pip=pip3

#git diff with line numbers
alias gd="~/.local/bin/git-diffn.sh"

alias gl='git log --graph --pretty=oneline --abrev-commit'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

typeset -U path
