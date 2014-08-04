# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export DEFAULT_USER=jeduan
# ZSH_THEME="agnoster"
ZSH_THEME="pure"

# git aliases

alias ip="ifconfig | grep inet\ "
alias gsp="git smart-pull"
alias gl="git smart-log"
alias gp="git push"
alias gaa="git add -A"
alias gs="git status --short"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(jeduan brew gem node npm bower gitignore tmuxinator)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/heroku/bin:$PATH
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export EDITOR='vim'
export LANG=en_US.UTF-8

alias tmux="tmux -2"
alias tma="tmux attach -t"

# Base16 Shell
BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL


if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

if which direnv &>/dev/null ; then
  eval "$(direnv hook zsh)"
fi
