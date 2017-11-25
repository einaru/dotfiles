HISTFILE=$HOME/.bash_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTCONTROL=erasedups:ignorespace
HISTIGNORE="l:ll:ls *"

shopt -s histappend

bind '"\e0A": history-search-backward'
bind '"\e[A": history-search-backward'
bind '"\e0B": history-search-forward'
bind '"\e[B": history-search-forward'

source ~/.shell/envvars.sh
source ~/.shell/aliases.sh
source ~/.shell/functions.sh

# Add local bash configurations in this file
if [ -f ~/.bashrc_local ]; then
	source ~/.bashrc_local
fi

source ~/.dotfiles/bash/prompt.sh
