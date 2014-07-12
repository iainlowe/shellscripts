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

[ -n "$force" ] && rm -rf ~/.shs

echo -n "Installing Shellscripts... "
git clone -q http://github.com/ilowe/shellscripts ~/.shs
echo "done"

if ! grep 'github.com/ilowe/shellscripts' ~/.bashrc &>/dev/null; then
	echo '' >> ~/.bashrc
	cat <<EOF >> ~/.bashrc
##########################################################################################
#################### Added by github.com/ilowe/shellscripts installer ####################
source ~/.shs/shs.sh
##########################################################################################
EOF
fi

source ~/.bashrc