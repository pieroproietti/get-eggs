#!/usr/bin/env bash

function el9 {
    TYPE="el9"
    PACKAGE="penguins-eggs_${LAST_RELEASE}-1.el9.x86_64.rpm"
    INSTALL_CMD="dnf install -y /tmp/$PACKAGE"
    get_package
}

el9