#!/bin/bash
if [ -z "$1" ]; then
    VERSION="10.1.1"
else
    VERSION="$1"
fi
VERSIONS=$1

VERSION="10.1.1-10"
DOWNLOAD_PAGE="https://sourceforge.net/projects/penguins-eggs/files/Packages/tarballs/"
wget -q  -O "penguins-eggs_10.1.1-10-linux-x64.tar.gz" "${DOWNLOAD_PAGE}/penguins-eggs-${VERSION}.apk/download"
