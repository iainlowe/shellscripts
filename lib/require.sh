export REQUIRED_MODULES=

function require() {
	local lib=$1
	local libpath=~/.shs/lib/${lib}.sh

	for rmod in $REQUIRED_MODULES; do
		if [ "$rmod" = "$lib" ]; then
			return
		fi
	done

	[ -f "$libpath" ] && source "$libpath"

	export REQUIRED_MODULES="$REQUIRED_MODULES $lib"
}

function unload() {
	local lib=$1

	type _${lib}_unload &>/dev/null && _${lib}_unload && unset -f _${lib}_unload

	declare -F | grep "_${lib}" |  cut -d' ' -f3 | while read func; do
		type $func &>/dev/null && unset -f $func &>/dev/null
	done

	export REQUIRED_MODULES=$(echo $REQUIRED_MODULES | sed "s/$lib//g")
}