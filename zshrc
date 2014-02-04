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
alias gm="git smart-merge"
alias gaa="git add -A"
alias gs="git status --short"
alias gi="git "

# node.js aliases
alias mocha="NODE_ENV=test mocha"

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

function gignore() { curl http://gitignore.io/api/$@ ;}
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(jeduan brew gem node npm git bower tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export NODE_PATH="/usr/local/lib/node:/usr/local/share/npm/lib/node_modules:$NODE_PATH"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:$HOME/.deliver/bin:$PATH
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export EDITOR='vim'
export CDPATH=".:~:~/Code"
alias mocha="NODE_ENV=test mocha"

alias tma="tmux -CC attach -t"
function git-tmux() {
  CURRENT=`basename ${PWD}`
  tmux -CC new -s $CURRENT -n editor
  tmux send-keys -t $CURRENT 'vim .' C-m
}

# Base16 Shell
BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL


# export DYLD_LIBRARY_PATH="/usr/local/lib/mysql:$DYLD_LIBRARY_PATH"

eval "$(rbenv init -)"
