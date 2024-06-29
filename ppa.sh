#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_debian {
    NODESOURCE=false
    source /etc/os-release

    case $VERSION_CODENAME in 
        # Debian/Devuan/Ubuntu
        bookworm | trixie | daedalus | noble)
            echo ">> get-eggs, OK, is Debian or derivatives"
            ;;

        buster | bullseye | chimaera | focal | jammy)
            NODESOURCE=true
            echo ">> get-eggs, OK, is Debian or derivatives"
            ;;

        bionic)
            echo "On Ubuntu bionic and derivatives, use manual procedure:"
            echo ""
            echo "- Install node16 from nodesource repository."
            echo "  copy and past the following commands"
            echo ""
            echo "sudo apt-get install -y curl"
            echo "curl -fsSL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh"
            echo "sudo -E bash nodesource_setup.sh"
            echo ""
            echo " - Download penguins-eggs-10.0.x-bionic-x.deb from sourceforge"
            echo "  copy and past the following command"
            echo ""
            echo "sudo dpkg -i penguins-eggs-10.0.x-bionic-x.deb"
            exit
            ;;


        #
        # derivatives
        #

        #elementary horus derivata da Ubuntu focal
        horus) 
            NODESOURCE=true
            echo ">> get-eggs OK, is Elementary or derivatives"
            ;;

        # LMDE
        elsie | faye)
            echo ">> get-eggs OK, is LMDE or derivatives"
            ;;

        # linuxmint / luberri derivata da Ubuntu jammy
        vanessa | vera | victoria | virginia)
            NODESOURCE=true
            echo ">> get-eggs OK, is Linuxmint or derivatives"
            ;;

        # kali
        kali-rolling)
            echo ">> get-eggs OK, is Kali or derivatives"
            ;;

        # netrunner derivata da Debian stable
        desktop)
            echo ">> get-eggs OK, is Kali or derivatives"
            ;;

        # parrot derivata da Debian bookworm
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
        echo ">> get-eggs: "
        echo "   penguins-eggs-ppa.list repository already present!"
        echo "   To install penguins-eggs, copy and past the following commands"
        echo ""
        echo "sudo apt update"
        echo "sudo apt install penguins-eggs"
        exit
    fi
}

function nodesource {
    FILE=/etc/apt/sources.list.d/nodesource.list
    if test -f "$FILE"; then
        echo ">> get-eggs: nodesource.list already present!"
    else
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    fi
}

function main {
    is_debian
    is_ppa

    echo ""
    echo ">> get-eggs: adding spare tools..."
    echo ""

    apt-get update --yes
    apt-get install curl gpg --yes

    # Add nodejs 18.x repo
    if [ "$NODESOURCE" = true ]; then
        nodesource
    fi    

    curl -fsSL "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | gpg --dearmor -o /usr/share/keyrings/penguins-eggs-ppa.gpg
    echo "deb [signed-by=/usr/share/keyrings/penguins-eggs-ppa.gpg] https://pieroproietti.github.io/penguins-eggs-ppa ./ " | tee /etc/apt/sources.list.d/penguins-eggs-ppa.list > /dev/null

    apt-get update --yes
    apt-get install penguins-eggs --yes
    eggs dad -d

    echo ">> get-eggs: finished! You can remove it"
}

main