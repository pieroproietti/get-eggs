#!/usr/bin/env bash

function debs {
    FOLDER="debs"
    PACKAGE="penguins-eggs_${LAST_RELEASE}-1_amd64.deb"
    INSTALL_CMD="dpkg -i /tmp/$PACKAGE"
    get_package
}

debs