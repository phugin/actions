#!/bin/bash

echo "Entrypoint start: $0 $*"

cd $GITHUB_WORKSPACE

make -j2
[ -d output ] && ls -al output/images
