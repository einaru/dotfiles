# Android configuration
# --------------------------------------------------------------------------- #

prepend_path() {
	if [ ! -z "$1" ] && [ -d "$1" ]; then
		PATH="$1:$PATH"
	fi
}

if [ -d "$HOME/android/sdk" ]; then
	export ANDROID_HOME="$HOME/android/sdk"
	prepend_path "$ANDROID_HOME/emulator"
	prepend_path "$ANDROID_HOME/tools"
	prepend_path "$ANDROID_HOME/tools/bin"
	prepend_path "$ANDROID_HOME/platform-tools"
	export PATH=$PATH

	export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
	# The emulator command complains about missing qt libs.
	# Running inside the $ANDROID_HOME/tools directory seems to solve this.
	emulator() {
		(
			cd $ANDROID_HOME/tools &&
			   $ANDROID_HOME/emulator/emulator $@
		)
	}
fi

unset -f prepend_path

