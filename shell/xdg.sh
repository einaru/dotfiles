# See: https://wiki.archlinux.org/index.php/XDG_Base_Directory

has () { return $(hash "$1" 2>/dev/null); }

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"

has irssi && alias irssi --config="${XDG_CONFIG_HOME}/irssi/config" --home="${XDG_DATA_HOME}/irssi"

unset -f has
