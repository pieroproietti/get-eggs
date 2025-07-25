#!/usr/bin/env bash

function alpine {
    FOLDER="alpine/x86_64"
    PACKAGE=[   "penguins-eggs-${LAST_RELEASE}-r1.apk", \
                "penguins-eggs-bash-completion${LAST_RELEASE}-r1.apk", \
                "penguins-eggs-doc-${LAST_RELEASE}-r1.apk" \
    ]
    INSTALL_CMD="apk add /tmp/$PACKAGE"
    get_package
}

alpine