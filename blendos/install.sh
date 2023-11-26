function is_breakfast {
    if grep -Fxq "[is_breakfast]" /etc/pacman.conf; then
        echo ">> blendos/install: breakfast already present!"
        exit
    fi    
}


function main {
   cp system.yaml /

   is_breakfast

   echo "[breakfast]" >> /etc/pacman.conf
   echo "SigLevel = Never" >> /etc/pacman.conf
   echo "Server = https://pkg-repo.blendos.co" >> /etc/pacman.conf
   pacman -Sy akshara
   # akshara update
}

main