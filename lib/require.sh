function require() {
	local lib=$1
	local libpath=~/.shs/lib/${lib}.sh

	[ -f "$libpath" ] && source "$libpath" 
}

function unload() {
	local lib=$1

	declare -F | grep "_${lib}" |  cut -d' ' -f3 | xargs unset -f $func
	_${lib}_unload
	unset -f "_${lib}_unload"
}