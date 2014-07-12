function _wd_contains() {
    echo $1 | grep "$2"
}

function _wd_isclean() {
    local output=`git -C $repo status -s`
    [ -z "$output" ]
}

function wd() {
    local repodir=${REPO_DIR:-~/work}
    local cmd=${1:-check}

    case $cmd in
        check)
            find $repodir -maxdepth 2 -name .git -type d | sed 's/\/.git//g' | while read repo; do
                output=`git -C $repo status -s`
                if [ -z "$output" ]; then
                    cecho "$repo is clean" $green
                else
                    cecho "$repo has changes:" $yellow
                    git -C $repo status -s
                fi 
            done
            ;;
        clean)
            find $repodir -maxdepth 2 -name .git -type d | sed 's/\/.git//g' | while read repo; do
                if repo_isclean $repo; then
                    cecho -n "Removing clean repo $repo ... " $green
                    rm -rf $repo
                    cecho OK $green
                fi
            done 
}

function _repos_unload() { unset -f wd }