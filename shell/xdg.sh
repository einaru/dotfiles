# XDG related environment variable setup
# --------------------------------------------------------------------------- #
# See: https://wiki.archlinux.org/index.php/XDG_Base_Directory

has () { return $(hash "$1" 2>/dev/null); }

has docker && export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
has ffmpeg && export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
has npm    && export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

unset -f has
