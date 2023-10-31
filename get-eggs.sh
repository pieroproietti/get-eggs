#!/bin/bash -e

source /etc/os-release

# Read $ID
if [ "$ID" = "debian" ]; then
    source ./ppa.sh
elif [ "$ID" = "arch" ]; then
    source ./aur.sh
fi

# $ID changed, but $ID_LIKE
if [ "$ID_LIKE" = "debian" ]; then
    source ./ppa.sh
elif [ "$ID_LIKE" = "ubuntu debian" ]; then
    source ./ppa.sh
elif [ "$ID_LIKE" = "arch" ]; then
    source ./aur.sh
fi

#
# ID_LIKE not set
# 

# blendos need
if [ "$ID" = "blendos" ]; then
    source ./aur.sh
elif [ "$ID" = "crystal" ]; then
    source ./aur.sh
fi
