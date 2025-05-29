# ALDOS

Installare penguins-eggs in questo modo è estremamente semplice, ed è anche molto semplice costruire il tarball.

Io lo faccio su Debian utilizzando node20.

```
sudo apt install nodejs
sudo npm i pnpm
```

A questo punto faccio il clone del progetto:

```
git clone https://github.com/pieroproietti/penguins-eggs
cd penguins eggs
pnpm i
pnpm tarballs
```

Il file `eggs-v10.0.55-11142b43-linux-x64.tar.gz` viene creato in `dist` quind lo rinomino come `penguins-eggs-tarball-v10.0.55-1-linux-x64.tar.gz` per semplice comodità.

La sua installazione avviene su ALDOS, scaricandolo ad esempio in Downloafs e:

```
git clone https://github.com/pieroproietti/penguins-packs
cd penguins-packs/tarballs
./setup ~/Downloads/penguins-eggs-tarball-v10.0.55-1-linux-x64.tar.gz 
```





