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
	echo $PATH | sed 's|:|\n|g'
}

# Swiss-army knife for extracting various types of archive files
extract ()
{
	if [ -z "$1" ]; then
		echo 'usage: extract file [file ...]' >&2
		return 1
	fi

	for file in $@; do
		if [ -f "$file" ]; then
			case "$file" in
				(*.tar.gz |*.tgz)   tar -xvzf "$file" ;;
				(*.tar.bz2|*.tbz)   tar -xvjf "$file" ;;
				(*.tar.xz |*.txz)   tar -xvJf "$file" ;;
				(*.tar.zma|*.tlz)   tar -xvf --lzma "$file" ;;
				(*.tar)             tar -xvf "$file" ;;
				(*.gz)              gunzip "$file" ;;
				(*.bz2)             bunzip2 "$file" ;;
				(*.xz)              unxz "$file" ;;
				(*.lzma)            unlzma "$file" ;;
				(*.Z)               uncompress "$file" ;;
				(*.zip|*.war|*.jar) unzip "$file" ;;
				(*.rar)             unrar x -ad "$file" ;;
				(*.7z)              7za x "$file" ;;
				(*)
					echo "extract: unable to extract '$file'" >&2
					return 1
					;;
			esac
		else
			echo "extract: $file is not a file." >&2
			return 1
		fi
	done
}

# Quickly navigate to development directories
devel ()
{
	local path="$HOME/Development"
	[ -d "$path/$1" ] && path="$path/$1"
	cd $path
}

# Put local functions in this file
if [ -f ~/.config/shell/functions.sh ]; then
	source ~/.config/shell/functions.sh
fi
