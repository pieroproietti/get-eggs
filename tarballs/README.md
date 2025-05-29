# eggs tarballs

Install penguins-eggs with a tarball, tested on almalinux, fedora, rockylinuz.


## Usage

Download the tarball from [https://penguins-eggs.net/basket](https://penguins-eggs.net/basket/index.php?p=packages%2Ftarballs), then:

* `git clone https://github.com/pieroproietti/penguins-packs`
* `cd penguins-packs/tarballs`
* `./setup ~/Downloads/penguins-eggs-tarball-10.0.54-1-linux-x64.tar.gz`

Although the setup command, is a simple bash script, and MUST be started as a common user, you must still have admin rights to do the installation.

penguins-eggs will be installed under the `/opt/penguins-eggs/ ` directory.


## BUILD tarballs

* `git clone https://github.com/pieroproietti/penguins-eggs`
* `cd penguins-eggs`
* `pnpm i`
* `pnpm tarballs`
* `./eggs export tarballs -c`
