#!/usr/bin/env bash

prog=$(basename $0)
ofile='favicon.ico'

usage() {
	cat <<-EndUsage
	$prog [-h] [-o file] infile

	Position arguments:

	  infile    Input file to create .ico file from

	Optional arguments:

	  -h        Show this help message and exit
	  -o file   Output filename (default: favicon.ico)

	EndUsage
}

die() {
	echo "$1" 1>&2
	exit 1
}

while getopts ":ho:" opt; do
	case ${opt} in
		h) usage ; exit 0 ;;
		o) ofile="$OPTARG" ;;
		?) die "Invalid option: -$OPTARG" ;;
		:) die "Invalid option: -$OPTARG requires an argument" ;;
	esac
done

shift $((OPTIND -1))
ifile="$1"

[ -z $ifile ] && die "No input file provided!"
[ ! -f $ifile ] && die "Input file is not a file: $ifile"

convert "$ifile" -background white \
	\( -clone 0 -resize 16x16 -extent 16x16 \) \
	\( -clone 0 -resize 32x32 -extent 32x32 \) \
	\( -clone 0 -resize 48x48 -extent 48x48 \) \
	-delete 0 -alpha on "$ofile"
