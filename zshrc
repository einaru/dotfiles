setopt autocd
unsetopt beep
bindkey -e
zstyle :compinstall filename ~/.zshrc

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
bindkey '\e[A' up-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

fpath=(~/.zsh/fpath $fpath)
[ -d ~/.config/zsh/fpath ] && fpath=(~/.config/zsh/fpath $fpath)

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

zstyle ':completion:*' rehash true

PURE_CMD_MAX_EXEC_TIME=10
PURE_PROMPT_SYMBOL='>'
prompt pure

#source ~/.shell/xdg.sh
source ~/.shell/config.sh
