# Ref: https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue#1-source-vtesh-in-bashrc
if [[ $TILIX_ID ]]; then
	if [[ -f /etc/profile.d/vte.sh ]]; then
		source /etc/profile.d/vte.sh
	fi
fi

