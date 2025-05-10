#!/bin/bash

echo "Entrypoint start: $0 $*"

cd $GITHUB_WORKSPACE

make -j2
