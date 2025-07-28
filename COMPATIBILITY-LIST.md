# Compatibility list

I just take the list from [distrowatch](https://distrowatch.com/), to get an idea where we are. The order reflect Page Hit Ranking at 2025 luly, 28:

* CachyOS: OK, but you need to: edit `/etc/os-release` and insert the line: `ID_LIKE=arch`, then create a symlink: `ln -s /boot/initramfs-initramfs.img /boot/initramfs-$(uname -r).img`
* Mint: OK
* MX Linux: OK, I suggest to remove mx-installer and mx-snapshot.
* EndeavourOS: OK
* Debian: OK
* Pop!_OS: OK
* Manjaro: OK
* Ubunt: OK
* Fedora: OK
* Zorin: OK
* openSUSE: OK, but calamares on the repos is not complete. Don't use it.
* Nobara: KO, calamares on the repos is not complete, and installation with krill don't boot too.
* elementary
* NixOS: Indipendent distro.
* KDE neon: OK
* AnduinOS: OK
* TUXEDO
* antiX: OK
* Bluestar: OK
* Garuda: KO. It use dracut to build initramfs and its package `garuda-dracut` conflict with `mkinitcpio`.
* AlmaLinux: 9.6 OK
* Kali: OK
* FreeBSD: KO, another OS
* Solus
* SparkyLinux: OK
* BigLinux: OK
* Alpine: OK
* CentOS
* Q4OS
* Lite
* Puppy: Indipendent distro
* EasyOS
* Tails
* Kubuntu
* OpenMandriva
* deepin: OK
* Linuxfx
* PCLinuxOS: Indipendent distro, as far as I know.
* Voyager
* Parrot: OK
* Rocky: OK
* Lubuntu: OK
* Slackware: Indipendent distro
* PorteuX
* Devuan: OK
* ALT
* DragonOS
* Red Hat: never tested
* Ultimate
* ReactOS: Another OS
* Xubuntu: OK
* KaOS: KO, this distro is declared Independent.
* Chimera
* Archcraft
* Vanilla
* Gentoo: Indipendent distro
* Calculate
* Commodore
* Arch: OK
* Feren
* Peppermint: OK
* RebornOS: OK
* blendOS
* Mageia
* Rhino: OK
* Bodhi: OK
* FunOS: Indipendent distro
* hostBSD: Another OS
* Nitrux: Indipendent distro
* wattO
* AV Linux
* Kodachi
* Mabox
* SDesk
* Artix
* Qubes
* Regata
* ArchBang
* Emmabuntüs
* Tiny Core
* Oracle
* Murena
* 4MLinux
* Bazzite
* AUSTRUMI
* Ultramarine
* TrueNAS
* Ubuntu MATE
* MakuluLinux
* Ubuntu Studio
* Proxmo
* Void
* OpenBSD
* PikaOS
* Dr.Parted
* Damn Small
* Haiku
* BunsenLabs
* Endless
* Porteus