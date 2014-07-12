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
