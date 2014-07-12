function _dirhook() {
    # Skip execution if we haven't changed directories
    [ "$SHS_DIRHOOKS_CWD" = `pwd` ] && return

    #if [ -f Dockerfile ]; then docker_hooks; else rmdocker; fi;
    if [ -d .git ]; then require git; else unload git; fi;
    
    export SHS_DIRHOOKS_CWD=`pwd`
}

export PROMPT_COMMAND=dirhook
# For other shells, maybe? Like zsh.. 
export chpwd=dirhook

_dirhook