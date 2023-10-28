#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_debian {
    CODENAME=$(lsb_release -cs)
    case $CODENAME in 
        # Debian
        buster | bullseye | bookworm | trixie)
            echo ">> PPA: OK, is Debian"
            ;;

        # Devuan
        chimaera | daedalus)
            echo ">> PPA OK, is Devuan"
            ;;

        # Ubuntu
        bionic | focal | jammy | noble)
            echo ">> PPA OK, is Ubuntu"
            ;;

        #
        # derivatives
        #

        # linuxmint
        vera | victoria)
            echo ">> PPA OK, is Linuxmint"
            ;;

        # LMDE
        elsie | faye)
            echo ">> PPA OK, is LMDE"
            ;;


        *)
          echo ">> PPA: is for Debian/Devuan/Ubuntu amd derivatives!"
          exit
    esac        
}

function is_ppa {
    
    FILE=/etc/apt/sources.list.d/penguins-eggs-ppa.list
    if test -f "$FILE"; then
        echo ">> PPA: penguins-eggs-ppa.list already present!"
        exit
    fi
}


function main {
    is_debian
    is_ppa

    echo ""
    echo ">> PPA: add spare tools..."
    echo ""

    apt update
    apt install curl gpg
    curl -fsSL "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | gpg --dearmor -o /usr/share/keyrings/penguins-eggs-ppa.gpg
    echo "deb [signed-by=/usr/share/keyrings/penguins-eggs-ppa.gpg] https://pieroproietti.github.io/penguins-eggs-ppa ./ " | tee /etc/apt/sources.list.d/penguins-eggs-ppa.list > /dev/null
    apt update
    apt install eggs
    eggs dad -d
    echo ">> PPA: finished"
    read -rp ">> ADDAURA: you can remove it!"
}

main