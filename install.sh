#!/bin/bash

force=

for arg in "$@"; do
	case $arg in
		-f|--force) force=1;;
	esac
done

if [ -z "$force" ] && [ -d ~/.shs ]; then
	echo "Already installed. Use 'shs update' instead."
	exit 5
fi

function check_bootstrap_deps() { # At a minimum we need a git command to start
	if ! which git &>/dev/null; then
		echo "No git executable found. Install git and try again."
		exit 4
	fi
}

check_bootstrap_deps

git clone http://github.com/ilowe/shellscripts ~/.shs

if ! grep 'github.com/ilowe/shellscripts' ~/.bashrc; then
	echo '' >> ~/.bashrc
	cat <<EOF >> ~/.bashrc
##########################################################################################
#################### Added by github.com/ilowe/shellscripts installer ####################
source ~/.shs/shs.sh
##########################################################################################
EOF
fi