has () { return $(hash "$1" 2>/dev/null); }

alias ..=' cd ..'
alias ...=' cd ../..'

alias ls='env LC_COLLATE=POSIX ls --color=auto --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias lls='ls -lA | grep "\->" --color=none'

alias tree='env LC_COLLATE=POSIX tree'

alias grep='grep --color=auto'

alias df='df -hTl -xtmpfs -xdevtmpfs --total'

# Protecting against overwriting
alias cp='cp -i'
alias mv='mv -i'

has rsync && alias rsync='rsync -avzP'

has vim  && alias vimrs='vim --remote-silent'
has gvim && alias gvimrs='gvim --remote-silent'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

has xclip && alias xclip='xclip -selection clipboard'

has expac && alias list-my-pkg='expac "%n %p" | grep "Einar Uvsløkk" | column -t'

_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java "$_SILENT_JAVA_OPTIONS"'

if has google-chrome-stable; then
	alias google-chrome='google-chrome-stable'
	alias messenger='google-chrome-stable --app=https://www.messenger.com'
fi

if has todo.sh; then
	TODOTXT_CFG_FILE="$HOME/.config/todo.cfg"
	alias todo.sh="todo.sh -d $TODOTXT_CFG_FILE"
	alias t="todo.sh -d $TODOTXT_CFG_FILE"
	unset TODOTXT_CFG_FILE
fi

unset -f has

# Put local aliases in this file
if [ -f ~/.config/shell/aliases.sh ]; then
	source ~/.config/shell/aliases.sh
fi
