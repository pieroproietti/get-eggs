# get-eggs

**get-eggs**: install penguins-eggs and configure it on your AlmaLinux, AlpineLinux, Arch, Debian, Devuan, Fedora, Manjaro, Openmamba, openSuSE, RockyLinu, Ubuntu and most derivatives.

# Notes
* on Arch, you can add Automated building repo for AUR packages [Chaotic-AUR](https://aur.chaotic.cx/) to get fresh penguins-eggs packages.

* on Debian/Devuan/Ubuntu and derivatives, it's possible to [pengins-eggs-ppa](https://github.com/pieroproietti/penguins-eggs-ppa) for penguins-eggs and eggsmaker, using `sudo eggs tools ppa --add`;

* on non recent distros, like: Debian buster / bullseye, Ubuntu 20.04 / 22.04 and derivatives, you must to add [nodesource repo](https://github.com/nodesource/distributions?tab=readme-ov-file#debian-and-ubuntu-based-distributions) for nodejs>=18 before to run get-eggs;

* In some distributions, where nodejs >=18 is not available, you can still install penguins-eggs installing nodejs=16 from [nodesource repo](https://github.com/nodesource/distributions?tab=readme-ov-file#debian-and-ubuntu-based-distributions) and manually installing  the special package [penguins-eggs-25.x.x-1bionic.amd64.deb](https://penguins-eggs.net/basket/index.php/packages/?p=packages%2Fdebs) we continue to mantain.

# USAGE

* `git clone https://github.com/pieroproietti/get-eggs`
* `cd get-eggs`
* `sudo ./get-eggs`

And follow instructions.

# Fork it!
This is a short and simple script, you are encouraged to fork it and adapt it to your needs. Of course PR will welcomed!