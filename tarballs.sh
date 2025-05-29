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

if [ $FOUND==1 ]; then
    clear
    echo ">> get-eggs: OK, is $ID, penguins-eggs can be installed"
    echo ""
    echo "Disable SELINUX:"
    echo "- edit /etc/selinux/conf line SELINUX=disabled"
    echo "- reboot"
    echo ""
    echo "Download penguins-eggs_10.1.1-1-linux-x64.tar.gz from https://penguins-eggs/basket"
    echo ""
    echo "Install requirements:"
    echo "sudo tarballs/requirements/$ID/install.sh"
    echo ""
    echo "Install penguins-eggs:"
    echo "tarballs/setup path/to/penguins-eggs_10.1.1-1-linux-x64.tar.gz"
    echo ""
    echo "enjoy!"
else
    echo ">> get-eggs: KO, is $ID, penguins-eggs cannot be installed"
fi



