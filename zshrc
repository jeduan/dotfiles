#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# git aliases

alias ip="ifconfig | grep inet\ "
alias gsp="git smart-pull"
alias gl="git smart-log"
alias gp="git push"
alias gaa="git add -A"
alias gs="git status --short"

alias tmux="tmux -2"
alias tma="tmux attach -t"
alias npmr="npm run"

BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

if which direnv &>/dev/null ; then
  eval "$(direnv hook zsh)"
fi
# source /usr/local/opt/autoenv/activate.sh

# load z
source `brew --prefix`/etc/profile.d/z.sh

# add hub
# eval "$(hub alias -s)"
source $(brew --prefix nvm)/nvm.sh

