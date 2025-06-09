#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function main {
    clear
    echo ""
    echo ">> get-eggs: will install penguins-eggs" 
    echo "public key: piero.proietti@gmail.com-66b8815d.rsa.pub will installed"
    echo ""
    press_a_key_to_continue

    # prerequisites
    apk add shadow fuse lsb-release

    # enable sudo
    if [ ! -e /usr/bin/sudo ]; then
        ln -s /usr/bin/doas /usr/bin/sudo
    fi

    # enable fuse
    if [ ! -e /etc/modules-load.d/fuse.conf ]; then
        echo "fuse" | tee /etc/modules-load.d/fuse.conf
    fi
    arch=$(uname -m)
    if [ "$arch" = "x86_64" ]; then
        ARCH="x86_64"
    elif [ "$arch" = "i686" ]; then
        ARCH="x86"
    fi
    VERSION="10.1.1-r8"
    cp -f piero.proietti@gmail.com-68452915.rsa.pub /etc/apk/keys/
    mkdir -p /tmp/"$DOAS_USER"/packages/alpine/"$ARCH"/
    cd /tmp/"$DOAS_USER"/packages/alpine/"$ARCH"/
    wget -O penguins-eggs-"$VERSION".apk https://sourceforge.net/projects/penguins-eggs/files/alpine/"$ARCH"/penguins-eggs-"$VERSION".apk/download
    wget -O penguins-eggs-bash-completion-"$VERSION".apk https://sourceforge.net/projects/penguins-eggs/files/alpine/"$ARCH"/penguins-eggs-bash-completion-"$VERSION".apk/download
    wget -O penguins-eggs-doc-"$VERSION".apk https://sourceforge.net/projects/penguins-eggs/files/alpine/"$ARCH"/penguins-eggs-doc-"$VERSION".apk/download
    apk add penguins-eggs*

    echo ">> get-eggs: finished! You can remove it"
    echo ">> type \"chsh -s /bin/bash\", then \"reboot\""
}


####
# start
###

if command -v doas >/dev/null 2>&1; then
    SUDO='doas'
else
    SUDO='sudo'
fi

main
