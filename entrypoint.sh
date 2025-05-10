#!/bin/bash

echo "Entrypoint start: $0 $*"

cd $GITHUB_WORKSPACE

make show-targets
mkdir -p output
pwd
ls -al
echo "Build end"
