#!/bin/bash

if [ -d ~/.shs ]; then
	echo "Already installed. Use 'shs update' instead."
	exit 5
fi

mkdir ~/.shs

function check_bootstrap_deps() { # At a minimum we need a git command to start
	if ! which git &>/dev/null; then
		echo "No git executable found. Install git and try again."
		exit 4
	fi
}

check_bootstrap_deps
