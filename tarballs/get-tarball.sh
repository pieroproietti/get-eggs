#!/bin/bash
if [ -z "$1" ]; then
    VERSION="10.1.1"
else
    VERSION="$1"
fi
VERSIONS=$1
wget https://penguins-eggs.net/basket/index.php/packages/penguins-eggs_10.1.1-1-linux-x64.tar.gz
