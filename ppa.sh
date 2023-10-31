#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_debian {

    source /etc/os-release

    case $VERSION_CODENAME in 
        # Debian
        buster | bullseye | bookworm | trixie)
            echo ">> get-eggs, OK, is Debian or derivatives"
            ;;

        # Devuan
        chimaera | daedalus)
            echo ">> get-eggs OK, is Devuan or derivatives"
            ;;

        # Ubuntu
        bionic | focal | jammy | noble)
            echo ">> get-eggs OK, is Ubuntu or derivatives"
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
        vanessa | vera | victoria)
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
    curl -fsSL "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | gpg --dearmor -o /usr/share/keyrings/penguins-eggs-ppa.gpg
    echo "deb [signed-by=/usr/share/keyrings/penguins-eggs-ppa.gpg] https://pieroproietti.github.io/penguins-eggs-ppa ./ " | tee /etc/apt/sources.list.d/penguins-eggs-ppa.list > /dev/null
    apt-get update --yes
    apt-get install eggs --yes
    eggs dad -d

    echo ">> get-eggs, finished!"
    echo ">> you can remove it: rm get-eggs -rf"
    read -rp ""
    clear
}

main