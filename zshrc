# zplug
export ZPLUG_HOME=~/.config/zplug
source $(brew --prefix zplug)/init.zsh

zplug "djui/alias-tips"
zplug "rupa/z", use:z.sh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh, nice:10
# zplug "sdurrheimer/docker-compose-zsh-completion"
zplug "zsh-users/zsh-autosuggestions", nice:10
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:18 # Should be loaded 2nd last.
zplug "zsh-users/zsh-history-substring-search", nice:19 # Should be loaded last.
zplug "mafredri/zsh-async", on:sindresorhus/pure
zplug "sindresorhus/pure", nice:18
BASE16_SCHEME="ocean"
zplug "chriskempson/base16-shell", use:"scripts/base16-$BASE16_SCHEME.sh", nice:-19
zplug "chriskempson/base16-shell", use:colortest, as:command
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
export EMOJI_CLI_KEYBIND="^e"
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
zplug "b4b4r07/enhancd", use:"init.sh"
zplug "unixorn/tumult.plugin.zsh"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load --verbose

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Enable ^, see https://github.com/robbyrussell/oh-my-zsh/issues/449#issuecomment-6973326
setopt NO_NOMATCH

setopt AUTOCD

export CLICOLOR=1
export BLOCK_SIZE=human-readable # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zhistory

# use brew's zsh
autoload run-help
HELPDIR=$(brew --prefix zsh)/help



if which direnv &>/dev/null ; then
  eval "$(direnv hook zsh)"
fi

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

source ~/.iterm2_shell_integration.zsh
# [ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.zprofile ] && source ~/.zprofile
[ -f ~/.zalias ] && source ~/.zalias
