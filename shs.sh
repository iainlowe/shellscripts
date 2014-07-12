#!/bin/bash

VERSION=`git -C ~/.shs tag -l | head -n1`

source ~/.shs/lib/colorecho.sh
source ~/.shs/lib/dirhooks.sh
source ~/.shs/lib/cli.sh

echo Shellscripts v$VERSION loaded