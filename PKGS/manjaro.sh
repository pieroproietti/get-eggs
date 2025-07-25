#!/usr/bin/env bash

function manjaro {
    TYPE="manjaro"
    PACKAGE="penguins-eggs_${LAST_RELEASE}-1-any.pkg.tar.zst"
    INSTALL_CMD="pacman -U --noconfirm /tmp/$PACKAGE"
    get_package
}

manjaro