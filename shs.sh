#!/bin/bash

VERSION=`git tag -l | head -n1 || echo unreleased`

source ~/.shs/lib/colorecho.sh

function shs() {
	local cmd=$1
	shift

	case $cmd in
		up|update) shs_update;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

function shs_update() {
	git -C ~/.shs pull
	source ~/.bashrc
}

echo Shellscripts v$VERSION loaded