function _dirhook() {
    # Skip execution if we haven't changed directories
    [ "$HOOK_CWD" = `pwd` ] && return

    if [ -f Dockerfile ]; then docker_hooks; else rmdocker; fi;
    if [ -d .git ]; then git_hooks; else rmgit; fi;
    
    export HOOK_CWD=`pwd`
}

export SHS_DIRHOOKS_CWD=`pwd`
export PROMPT_COMMAND=dirhook

# For other shells, maybe? Like zsh.. 
export chpwd=dirhook