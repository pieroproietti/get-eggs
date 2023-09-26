#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_debian {
    RELEASE=$(lsb_release -is)
    case $RELEASE in 
        buster)
            echo ">> PPA: OK, is Debian"
            ;;
        bookworm)
            echo ">> PPA: OK, is Debian"
            ;;
        trixie)
            echo ">> PPA OK, is Debian"
            ;;

        # Devuan
        chimaera)
            echo ">> PPA OK, is Devuan"
            ;;
        daedalus)
            echo ">> PPA OK, is Devuan"
            ;;

        # Ubuntu
        bionic)
            echo ">> PPA OK, is Ubuntu"
            ;;
        focal)
            echo ">> PPA OK, is Ubuntu"
            ;;
        jammy)
            echo ">> PPA OK, is Ubuntu"
            ;;
        *)
          echo ">> PPA: is for DEBIAN!"
          exit
    esac        
}

function is_ppa {
    
    FILE=/etc/apt/sources.list.d/penguins-eggs-ppa.list
    if test -f "$FILE"; then
        echo ">> PPS: penguins-eggs-ppa.list already present!"
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
}

main