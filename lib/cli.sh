#!/bin/bash

function shs() {
	local cmd=$1
	shift

	case $cmd in
		up|update) _cli_update;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

function _cli_update() {
	git -C ~/.shs pull
	source ~/.bashrc
}

function _cli_unload() {
	unset shs
}

