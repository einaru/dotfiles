has () { return $(hash "$1" 2>/dev/null) }

alias ..=' cd ..'
alias ...=' cd ../..'

alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -lAh'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias lls='ls -lA | grep "\->" --color=none'

alias grep='grep --color=auto'

alias df='df -hTl -xtmpfs -xdevtmpfs --total'

# Protecting against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias cdgr='cd "$(git root)"'

has rsync && alias scp='rsync -avzP'

has vim  && alias vimrs='vim --remote-silent'
has gvim && alias gvimrs='gvim --remote-silent'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

has xclip && alias xclip='xclip -selection clipboard'

unset -f has
