#speed up copy+paste into terminals
DISABLE_MAGIC_FUNCTIONS="true"

if [[ $(uname -m) == 'arm64' ]]; then
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
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.npm-packages/bin
export GPG_TTY=$(tty)

ZSH_THEME="daivasmara"
export ZSH="$HOME/.oh-my-zsh"

HYPHEN_INSENSITIVE=true
ENABLE_CORRECTION=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS=dd.mm.yyyy

# BACKLOG: use plugin manager for zsh for conditional plugin management
if [[ $(uname -m) == 'arm64' ]]; then
  plugins=(
    git
    git-auto-fetch
    ssh-agent
    colored-man-pages
    sudo
    web-search
    copypath
    copyfile
    history
    jsontools
    macos
  )
else
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
fi

# User configuration

# IMPORTANT: source $ZSH/oh-my-zsh.sh after loading plugins
source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=248"

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR="nvim"

# ---- START OF INSTALL SCRIPT -----

# xcode-select --install
# sudo xcodebuild -license accept

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew installation path on Apple M1 machines are different
if [[ $(uname -m) == 'arm64' ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo $($(which brew) shellenv) >>~/.zprofile
  eval ~/.zprofile >/dev/null 2>&1
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

# brew install git-extras
source $(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh

# brew install keychain
# mkdir -p ~/.ssh
# -K, -A is deprecated, use --apple-use-keychain, --apple-load-keychain respectively
# ssh-add -l
# if [[ `uname -m` == 'arm64' ]]; then
# ssh into mephisto (DigitalOcean) vps; use `ssh mindhuntr` to start a session
ssh-add --apple-use-keychain ~/.ssh/mindhuntr_rsa -q
# fi

ssh-add --apple-use-keychain ~/.ssh/id_ed25519 -q

ssh-add --apple-use-keychain ~/.ssh/ireify.ssh -q

#export NPM_HOME="$(which npm)"

source $HOME/.dotfiles/k.sh
source $HOME/.dotfiles/docker.sh
source $HOME/.dotfiles/utils/datetime_utils.sh
source $HOME/.dotfiles/utils/theme_utils.sh

# ---- END OF INSTALL SCRIPT -----

# checks to see if a variable is set
# returns 0=true, 1=false
env_exists() {
  ! [ -z ${!+set} ]
}

#colourises errors
#usage: command 2> >(colorize_stderr)
colorize_stderr() { (
  tput setaf 1
  cat
  tput sgr0
) >&2; }

(git config --global commit.verbose true)

alias rl="exec zsh"
alias relink='ln -s -f $HOME/.dotfiles/.zshrc $HOME/.zshrc'
alias vim=nvim
alias zshconfig='code $HOME/.dotfiles && cd $HOME/.dotfiles'
alias vimconfig='code $HOME/.config/nvim && zshconfig'
#in iterm2, requires a Nerd Font to be set for Non-ASCII text
# gem install colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls --color=always -lA --sd 2> >(colorize_stderr) || k --no-vcs 2> >(colorize_stderr) || \ls -aGlLp'
export XDG_CONFIG_HOME=$HOME/.config
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
alias pip=pip3

if [[ $(env_exists "GRADLE_HOME") -eq 1 ]]; then
  echo "Setting GRADLE_HOME"
  export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')
  echo $GRADLE_HOME
fi

#git diff with line numbers
alias gd=$HOME/.dotfiles/git-diffn.sh

alias gl="git log --tags --stat --pretty=format:'%C(green)%h%Creset %C(white)on%Creset %C(bold brightcyan) %ad %Creset %C(blue) (%ar) %Creset %C(white)by%Creset %C(red) %ae %n%GG%Creset%n%w(80,0,1)%+B%Creset' --date=format:'%d.%m.%Y @%H:%M'"

gbcp() {
  git branch | grep "*" | awk '{ print $2 }' | tr -d '\n' | pbcopy
}

gcgue() {
  git config --global user.email | tr -d '\n' | pbcopy
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PGDATA=$HOME/.config/postgres/data

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export PATH=$PATH:$HOME/.yarn/bin
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

#deduplicate $PATH -U=unique
#use path instead of PATH...in zsh path is a PATH as an array of strings
typeset -U path
