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
    echo ">> get-eggs: OK, is $ID"
    echo ""
    echo "Disable selinux:"
    echo "- edit /etc/selicnux/conf line SELINUX=disabled"
    echo "- reboot"
    echo ""
    echo "Download penguins-eggs_10.1.1-1-linux-x64.tar.gz from https://penguins-eggs/basket"
    echo ""
    echo "Install prerequisites:"
    echo "sudo tarballs/requirements/$ID/install.sh"
    echo ""
    echo "Install penguins-eggs:"
    echo "tarballs/setup path/to/penguins-eggs_10.1.1-1-linux-x64.tar.gz"
    echo ""
    echo "enjoy!"

fi



