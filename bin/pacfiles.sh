#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

dir='/etc'
[ ! -z "${1+x}" ] && dir="$1"
echo -e "\033[1;4mLooking for .pac{new,save} files under $dir\033[0m"
find "$dir" -regextype posix-extended -regex '.+\pac(new|save)' 2> /dev/null
