#!/bin/bash

VERSION=`git -C ~/.shs tag -l | head -n1`

# Bootstrap load require library
source ~/.shs/lib/require.sh

require colorecho
require dirhooks
require cli

echo Shellscripts v$VERSION loaded