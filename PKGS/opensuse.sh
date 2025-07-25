#!/usr/bin/env bash

function opensuse {
    TYPE="opensuse"
    PACKAGE="penguins-eggs_${LAST_RELEASE}-1.opensuse.x86_64.rpm"
    INSTALL_CMD="zypper  --non-interactive install /tmp/$PACKAGE"
    get_package
}

opensuse