#!/bin/bash -e

source /etc/os-release

# Read $ID
if [ "$ID" = "debian" ] || [ "$ID_LIKE" = "debian" ] || [ "$ID_LIKE" = "ubuntu debian" ]; then
    source ./ppa.sh
elif [ "$ID" = "arch" ] || [ "$ID_LIKE" = "arch" ]; then
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
