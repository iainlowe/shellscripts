export DOCKER_REGISTRY=`git config --null docker.registry && echo /`
export DOCKER_IMAGE=$(basename `pwd`)
export DOCKER_REPO=${DOCKER_REGISTRY}${DOCKER_IMAGE}

alias build='docker build -t $DOCKER_REPO .'
alias run='docker run -tiP --rm $(getdockopt run) $DOCKER_REPO'
alias shell='docker run -tiP --rm $(getdockopt run) $DOCKER_REPO /bin/bash'
alias start='docker run --name $DOCKER_IMAGE -dP $(getdockopt run) $DOCKER_REPO'
alias stop='docker kill $DOCKER_REPO | xargs docker rm'
alias dpush='docker push $DOCKER_REPO'
alias last='docker ps -lq'

function _docker_unload() {
    unalias build run shell start stop dpush last
    DOCKER_REGISTRY=
    DOCKER_IMAGE=
    DOCKER_REPO=
}