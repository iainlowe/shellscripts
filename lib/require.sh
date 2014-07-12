function require() {
	local lib=$1

	source ~/.shs/lib/${lib}.sh
}

function unload() {
	local lib=$1

	declare -F | grep "_${lib}" |  cut -d' ' -f3 | xargs unset -f $func
	_${lib}_unload
	unset -f "_${lib}_unload"
}