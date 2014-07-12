black='\E[30;47m'
red='\E[31;1m'
green='\E[32;1m'
yellow='\E[33;1m'
blue='\E[34;1m'
magenta='\E[35;1m'
cyan='\E[36;1m'
white='\E[37;1m'
grey='\E[1;30m'

function cecho() {
    local default_msg="No message passed."     # Doesn't really need to be a local variable.
    local echo_opts=

    [ "$1" = "-n" ] && shift && echo_opts=-n

    message=${1:-$default_msg}   # Defaults to default message.
    color=${2:-$black}           # Defaults to black, if not specified.

    echo $echo_opts -e "${color}${message}" >&2
    tput sgr0                      # Reset to normal.

    return
}

function _colorecho_unload() {
	unset -f cecho
	unset black red green yellow blue magenta white
}