#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_debian {
    NEED18=false
    NEED16=false
    source /etc/os-release

    case $VERSION_CODENAME in 
        # Debian/Devuan/Ubuntu
        bookworm | trixie | daedalus | noble)
            echo ">> get-eggs, OK, is Debian or derivatives"
            ;;

        buster | bullseye | chimaera | focal | jammy)
            NEED18=true
            echo ">> get-eggs, OK, is Debian or derivatives"
            ;;

        # Debian/Devuan/Ubuntu
        bionic)
            NEED16=true
            echo ">> get-eggs, OK, is Ubuntu or derivatives"
            ;;

        #
        # derivatives
        #

        #elementary
        horus)
            echo ">> get-eggs OK, is Elementary or derivatives"
            ;;

        # LMDE
        elsie | faye)
            echo ">> get-eggs OK, is LMDE or derivatives"
            ;;

        # linuxmint / luberri
        vanessa | vera | victoria | virginia)
            NEED18=true
            echo ">> get-eggs OK, is Linuxmint or derivatives"
            ;;

        # kali
        kali-rolling)
            echo ">> get-eggs OK, is Kali or derivatives"
            ;;

        # netrunner
        desktop)
            echo ">> get-eggs OK, is Kali or derivatives"
            ;;

        # parrot
        ara)
            echo ">> get-eggs OK, is Parrot or derivatives"
            ;;


        *)
          echo ">> PPA: is for Debian/Devuan/Ubuntu or derivatives!"
          exit
    esac        
}

function is_ppa {
    
    FILE=/etc/apt/sources.list.d/penguins-eggs-ppa.list
    if test -f "$FILE"; then
        echo ">> get-eggs: penguins-eggs-ppa.list already present!"
        exit
    fi
}


function main {
    is_debian
    is_ppa

    echo ""
    echo ">> get-eggs: add spare tools..."
    echo ""

    apt-get update --yes
    apt-get install curl gpg --yes

    # Add nodejs 16.x repo
    if [ "$NEED16" = true ]; then
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    fi    

    # Add nodejs 18.x repo
    if [ "$NEED18" = true ]; then
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    fi


    curl -fsSL "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | gpg --dearmor -o /usr/share/keyrings/penguins-eggs-ppa.gpg
    echo "deb [signed-by=/usr/share/keyrings/penguins-eggs-ppa.gpg] https://pieroproietti.github.io/penguins-eggs-ppa ./ " | tee /etc/apt/sources.list.d/penguins-eggs-ppa.list > /dev/null

    apt-get update --yes
    apt-get install penguins-eggs --yes
    eggs dad -d

    echo ">> get-eggs: finished! You can remove it"
}

main