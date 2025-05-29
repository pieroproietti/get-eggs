#!/bin/bash
if [ -z "$1" ]; then
    REQUIREMENTS=""
else
    REQUIREMENTS="--requirements"
fi

rm -f penguins-eggs-tarball*
scp artisan@192.168.1.2:/eggs/tarballs/penguins-eggs-tarball* .
./setup ./penguins-eggs-tarball* $REQUIREMENTS
# 
rm -f penguins-eggs-tarball*
