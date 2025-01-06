#!/bin/bash -e
source /etc/os-release

case $ID in 
    almalinux)
        echo ">> get-eggs: OK, is Almalinux"
        ;;
    fedora)
        echo ">> get-eggs: OK, is Fedora"
        ;;
    nobara)
        echo ">> get-eggs: OK, is Nobara"
        ;;
    opensuse)
        echo ">> get-eggs: OK, is Opensuse"
        ;;
    rocky)
        echo ">> get-eggs: OK, is Rocky"
        ;;
esac
