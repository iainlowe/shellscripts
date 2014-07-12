#!/bin/bash

function shs() {
	local cmd=$1
	shift

	case $cmd in
		up|update) _shs_update;;
		v|version) _shs_version;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

function _shs_version() {
	local version=$(echo version `git -C ~/.shs tag -l | head -n1`)

	[ "$version" = "version" ] && version=

	echo "shs ${version} (build `git -C ~/.shs log -n1 --oneline | cut -d' ' -f1`)"
}

function _shs_update() {
	git -C ~/.shs pull
	source ~/.bashrc
}

function _shs_unload() {
	unset shs
}

