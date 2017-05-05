
if [ -d "$HOME/.local/share/node_modules/bin" ] ; then
	PATH="$HOME/.local/share/node_modules/bin:$PATH"
fi

if [ -d "$HOME/.go" ]; then
	export GOPATH="$HOME/.go"
	if [ -d "$HOME/.go/bin" ]; then
		PATH="$HOME/.go/bin:$PATH"
	fi
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH
export EDITOR='vim'
export BROWSER='xdg-open'

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME="$HOME/.local/share/virtualenvs"
	[ ! -d $WORKON_HOME ] && mkdir -p $WORKON_HOME
	source /usr/bin/virtualenvwrapper.sh
fi

# Put local environment variables in this file
if [ -f ~/.config/shell/envvars.sh ]; then
	source ~/.config/shell/envvars.sh
fi
