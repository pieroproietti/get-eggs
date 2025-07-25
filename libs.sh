#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function get_package {
   URL="https://penguins-eggs.net/basket/packages/"
   echo "Download package: $PACKAGE from ${URL}${TYPE}"
   press_a_key_to_continue
   if command -v curl >/dev/null 2>&1; then
      curl -L -o "/tmp/${PACKAGE}" "${URL}${TYPE}/${PACKAGE}"
   fi
   echo "Install package: $PACKAGE using $INSTALL_CMD"
   press_a_key_to_continue
   ${INSTALL_CMD}
}