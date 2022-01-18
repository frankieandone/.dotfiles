#speed up copy+paste into terminals
DISABLE_MAGIC_FUNCTIONS="true"

if [[ `uname -m` == 'arm64' ]]; then
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
  export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
else
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"
  export PATH="/usr/local/sbin:$PATH"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/Library/Python/3.8/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.npm-packages/bin

ZSH_THEME="current"
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE=true
ENABLE_CORRECTION=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

plugins=(
  git
  git-auto-fetch
  ssh-agent
  colored-man-pages
  sudo
  web-search
  copydir
  copyfile
  history
  jsontools
  macos
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
# brew installation path on Apple M1 machines are different
if [[ `uname -m` == 'arm64' ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo `$(which brew) shellenv` >> ~/.zprofile
  eval ~/.zprofile > /dev/null 2>&1
fi

# brew install zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s $(which zsh)

# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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

source $(dirname $(gem which colorls))/tab_complete.sh

(git config --global commit.verbose true)

alias rl="exec zsh"
alias relink='ln -s -f $HOME/.dotfiles/.zshrc $HOME/.zshrc'
alias vim="lvim"
alias nvim="lvim"
alias zshconfig='cd $HOME/.dotfiles && lvim .zshrc'
# alias ls='ls -aGlLp'
alias ls='colorls -lA --sd'
alias vimconfig='code ~/.local/share/lunarvim'
export XDG_CONFIG_HOME="~/.config"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
alias pip=pip3

#git diff with line numbers
alias gd="~/.local/bin/git-diffn.sh"

alias gl="git log --pretty=format:'%C(green)%h%Creset %C(white)on%Creset %C(bold brightcyan) %ad %Creset %C(blue) (%ar) %Creset %C(white)by%Creset %C(red) %ae %Creset %n%w(80,0,1)%+B %Creset' --date=format:'%d.%m.%Y @%H:%M'"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

typeset -U path
