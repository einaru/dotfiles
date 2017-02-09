e ()
{
	if hash gvim 2>/dev/null && [[ -n $DISPLAY ]] ; then
		gvim "$@"
	else
		vim "$@"
	fi
}

# Update dotfiles
dfu ()
{
	(
		cd ~/.dotfiles && git pull --ff-only && ./install -q
	)
}

# Create a directory and cd into it
mcd ()
{
	mkdir "${1}" && cd "${1}"
}

# Serve current directory
serve ()
{
	python -mhttp.server "${1:-8000}"
}

# Pretty print $PATH
ppath ()
{
	echo $PATH | sed 's|:|\|g'
}

# Swiss-army knife for extracting various types of archive files.
# TODO:2014-10-16:einar: add option for extracting to directory
extract ()
{
	if [[ ! -f $1 ]]; then echo "extract: '$1' is not a file" ; return 1 ; fi

	local lower="${1,,}"

	case "$lower" in
		(*.tar.gz|*.tgz)    tar -xvzf "$1" ;;
		(*.tar.bz2|*.tbz)   tar -xvjf "$1" ;;
		(*.tar.xz|*.txz)    tar -xvJf "$1" ;;
		(*.tar.zma|*.tlz)   tar --lzma -xvf "$1" ;;
		(*.tar)             tar -xvf "$1" ;;
		(*.gz)              gunzip "$1" ;;
		(*.bz2)             bunzip2 "$1" ;;
		(*.xz)              unxz "$1" ;;
		(*.lzma)            unlzma "$1" ;;
		(*.Z)               uncompress "$1" ;;
		(*.zip|*.war|*.jar) unzip "$1" ;;
		(*.rar)             unrar x -ad "$1" ;;
		(*.7z)              7za x "$1" ;;
		(*) echo "extract: unable to extract '$1'" 1>&2 ; return 1 ;;
	esac
}

# Quickly navigate to development directories
devel ()
{
	local path="$HOME/Development"
	[ -d "$path/$1" ] && path="$path/$1"
	cd $path
}

