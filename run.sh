#!/bin/bash

cd $(dirname $0)

docker build -t ubuntu-perl .

docker run -it --rm -v $(pwd):/data -w /data ubuntu-perl "$@"

