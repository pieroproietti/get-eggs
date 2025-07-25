#!/usr/bin/env bash

function fedora {
    TYPE="fedora"
    PACKAGE="penguins-eggs_${LAST_RELEASE}-1.fc42.x86_64.rpm"
    INSTALL_CMD="dnf install -y /tmp/$PACKAGE"
    get_package
}

fedora