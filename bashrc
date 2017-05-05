HISTFILE=$HOME/.bash_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

shopt -s histappend

source ~/.shell/envvars.sh
source ~/.shell/aliases.sh
source ~/.shell/functions.sh

# Add local bash configurations in this file
if [ -f ~/.bashrc_local ]; then
	source ~/.bashrc_local
fi
