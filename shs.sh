#!/bin/bash

VERSION=`git -C ~/.shs tag -l | head -n1`

source ~/.shs/lib/colorecho.sh

function shs() {
	local cmd=$1
	shift

	case $cmd in
		up|update) _shs_update;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

function _shs_update() {
	git -C ~/.shs pull
	source ~/.bashrc
}

echo Shellscripts v$VERSION loaded