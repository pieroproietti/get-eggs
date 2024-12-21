# get-eggs

**get-eggs**: install penguins-eggs and configure it on your AlmaLinux, AlpineLinux, Arch, Debian, Devuan, Fedora, Manjaro, Openmamba, openSuSE, RockyLinu, Ubuntu and derivatives.

Before to start, we need the package `lsb-release` installed, this is default for mostly distros, but not on `AlpineLinux`  and `ArchLinux`.
* on Alpine, uncomment community from `/etc/apk/repositories`, then `doas apk add lsb-release`;
* on Arch, just install it: `sudo pacman -S lsb-release`.

On Arch, it will add AUR repository - from that the original name [addaura](./documentation/NAMING.md) - on Debian famility, it will add a PPA for penguins-eggs.

On Debian buster / bullseye, Ubuntu 20.04 / 22.04 and derivatives, get-eggs
will add [nodesource repo](https://github.com/nodesource/distributions?tab=readme-ov-file#debian-and-ubuntu-based-distributions) for nodejs>18.

To get a naked distro or a complete customized distro like colibri, starting from an original ISO Arch, Debian, Devuan or Ubuntu there is an [HOWTO](./documentation/HOWTO.md).


# USAGE

* `git clone https://github.com/pieroproietti/get-eggs`
* `cd get-eggs`
* `sudo ./get-eggs`

# Fork it!
This is a short and simple script, you are encouraged to fork the code and adapt it to your needs.