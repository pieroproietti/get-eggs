#!/bin/bash -e
source /etc/os-release

FOUND=0
case $ID in 
    almalinux)
        ;;
    fedora)
        FOUND=1
        ;;
    nobara)
        FOUND=1
        ;;
    opensuse)
        FOUND=1
        ;;
    rocky)
        FOUND=1
        ;;
esac

clear
if [ $FOUND == 1 ]; then
    echo ">> get-eggs: OK, is $ID, penguins-eggs can be installed"
    echo ""
    echo "First: if SELINUX is enbled, disable it, and reboot;"
    echo ""
    echo "- edit /etc/selinux/conf, add the  line SELINUX=disabled at the end"
    echo "- reboot"
    echo ""
    echo "Install requirements:"
    echo "sudo tarballs/requirements/$ID/install.sh"
    echo ""
    echo "Download penguins-eggs_10.1.1-1-linux-x64.tar.gz from https://penguins-eggs/basket"
    echo ""
    echo "Install penguins-eggs:"
    echo "tarballs/setup ~/Downloads/penguins-eggs_10.1.1-1-linux-x64.tar.gz"
    echo ""
    echo "enjoy it!"
else
    echo ">> get-eggs: is $ID, penguins-eggs install the package"
fi
