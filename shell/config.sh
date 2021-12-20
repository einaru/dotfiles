# Environment variables
# --------------------------------------------------------------------------- #

prepend_path() {
	if [ ! -z "$1" ] && [ -d "$1" ]; then
		PATH="$1:$PATH"
	fi
}

prepend_path "$HOME/.go/bin"
prepend_path "$HOME/.local/share/node_modules/bin"
prepend_path "$HOME/.dotfiles/bin"
prepend_path "$HOME/.local/bin"
prepend_path "$HOME/.poetry/bin"

unset -f prepend_path

export PATH=$PATH
export EDITOR='nvim'
export VISUAL=$EDITOR
export GOPATH="$HOME/.go"

# Aliases
# --------------------------------------------------------------------------- #

alias ..=' cd ..'
alias ...=' cd ../..'
alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias lls='ls -lA | grep "\->" --color=none'
alias grep='grep --color=auto'
alias df='df -hTl -xtmpfs -xdevtmpfs --total'
alias cp='cp -i'
alias mv='mv -i'
alias open='gio open'
alias peek='tee >(cat 1>&2)'
alias yeet='yay -Rncs'
alias mypkgs='expac "%n %p%" | grep "Einar Uvsløkk" | column -t'

# Functions
# --------------------------------------------------------------------------- #

update_dotfiles() {
	(cd ~/.dotfiles && git pull --ff-only && ./install -q)
}

ppath() {
	echo $PATH | sed 's|:|\n|g'
}

