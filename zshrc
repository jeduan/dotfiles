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

export EDITOR=vim
export ANDROID_HOME=$(brew --prefix android)

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
#
autoload -Uz promptinit
promptinit
prompt pure

function pull-request {
  local issue="$1"
  local issue_title="`get-issue-title $issue`"
  local branch="`git rev-parse --abbrev-ref HEAD`"
  local base_branch="`echo $branch | sed -E 's/^([^/]+)\/.+/\1/'`"
  hub pull-request -b $base_branch/development -m "Re: #$issue - $issue_title"
}

function get-issue-title {
  local issue="$1"
  local title="`hub issue | grep \" \+$issue\] \" | sed -E "s/ +$issue\] (.+) \( https\:\/\/github.+/\1/"`"
  echo $title
}

function focus {
  if [[ $# -eq 0 ]]; then
    open focus://focus
  else
    open focus://focus?minutes=$1
  fi
}

function unfocus {
  open focus://unfocus
}
