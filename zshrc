setopt autocd
unsetopt beep
bindkey -e
zstyle :compinstall filename $HOME/.zshrc

HISTFILE=$HOME/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

# Cycle through history based on characters already typed
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

fpath=($HOME/.zsh/fpath $fpath)
[ -d $HOME/.config/zsh/fpath ] && fpath=($HOME/.config/zsh/fpath $fpath)

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

zstyle ':completion:*' rehash true

PURE_CMD_MAX_EXEC_TIME=10
PURE_PROMPT_SYMBOL='>'
prompt pure

source ~/.shell/envvars.sh
source ~/.shell/aliases.sh
source ~/.shell/functions.sh

# Add local zsh configurations in this file
if [ -f ~/.config/zsh/local.zsh ]; then
	source ~/.config/zsh/local.zsh
fi
