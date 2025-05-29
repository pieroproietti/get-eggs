#!/bin/bash -e
source /etc/os-release

FOUND=0
case $ID in 
    almalinux)
        ;;
    fedora)
        FOUND=1
        echo ">> get-eggs: OK, is Fedora"
        ;;
    nobara)
        FOUND=1
        echo ">> get-eggs: OK, is Nobara"
        ;;
    opensuse)
        FOUND=1
        echo ">> get-eggs: OK, is Opensuse"
        ;;
    rocky)
        FOUND=1
        echo ">> get-eggs: OK, is Rocky"
        ;;
esac

if [ $FOUND==1 ]; then
    echo ">> get-eggs: OK, is $ID"
    echo "sudo tarballs/requirements/$ID/install.sh"
    echo "tarballs/setup penguins-eggs_10.1.1-1-linux-x64.tar.gz"
fi



