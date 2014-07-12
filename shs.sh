#!/bin/bash

VERSION=`git -C ~/.shs tag -l | head -n1`
[ -z "$VERSION" ] && VERSION=`git -C ~/.shs log -n1 --oneline | cut -d' ' -f1`

# Bootstrap load require library
source ~/.shs/lib/require.sh

require colorecho
require dirhooks
require cli

echo Shellscripts v$VERSION loaded