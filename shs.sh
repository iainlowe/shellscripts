#!/bin/bash

VERSION=`git tag -l | head -n1 || echo unreleased`

source ~/.shs/lib/

function shs() {
	local cmd=$1
	shift

	case $cmd in
		r|reload) shs_reload;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

echo Shellscripts v$VERSION loaded