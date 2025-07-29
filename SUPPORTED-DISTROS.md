# SUPPORTED DISTROS

I just take the list from [distrowatch](https://distrowatch.com/), to get an idea where we are.

Most of the information comes from direct experience, even from some time ago, and there may be errors. For example, some time ago Garuda could be remastered by removing the garuda-dracut package, but now it cannot.

If you have different results, or know more, you can report it in the [issues](https://github.com/pieroproietti/get-eggs/issues).


The order reflect Page Hit Ranking at 2025 luly, 28:

| Rank | Name   | Status | Note |
|------|--------|--------|------|
|   1 |[CachyOS](https://cachyos.org/)      | OK| You need to: edit `/etc/os-release` and insert the line: `ID_LIKE=arch`, then create a symlink: `ln -s /boot/initramfs-initramfs.img /boot/initramfs-$(uname -r).img`|
|  2|[Mint](https://linuxmint.com/)        | OK|
|  3|[MX Linux](https://mxlinux.org/)      |OK| I suggest to remove mx-installer and mx-snapshot|
|  4|[EndeavourOS](https://endeavouros.com/)|OK||
|  5|[Debian](https://www.debian.org/)      |OK||
|  6|[Pop!_OS](https://system76.com/pop/)   |OK||
|  7|[Manjaro](https://manjaro.org/)        |OK||
|  8|[Ubuntu](https://manjaro.org/)         |OK||
|  9|[Fedora](https://fedoraproject.org/)   |OK||
| 10|[Zorin](https://zorin.com/os/)         |OK||
| 11|[openSUSE](https://www.opensuse.org/)  |OK| calamares on the repos is not complete, use krill to install|
| 12|[Nobara](https://nobaraproject.org/)   |No| calamares on the repos is not complete, and installation with krill don't boot too|
| 13|[elementary](https://elementary.io)    |OK||
| 14|[NixOS](https://nixos.org/)            |No|Distro not supported|
| 15|[KDE neon](https://neon.kde.org/)      |OK||
| 16|[AnduinOS](https://www.anduinos.com/)  |OK||
| 17|[TUXEDO](https://www.tuxedocomputers.com/en/TUXEDO-OS_1.tuxedo)|OK||
| 18|[antiX](https://antixlinux.com/)       |OK||
| 19|[Bluestar](https://distrowatch.com/table.php?distribution=bluestar)|OK||
| 20|[Garuda](https://garudalinux.org/)     |No|It use dracut to build initramfs and its package `garuda-dracut` conflict with `mkinitcpio`|
| 21|[AlmaLinux](https://almalinux.org/)    |OK|version 9.6|
| 22|[Kali](https://www.kali.org/)          |OK||
| 23|[FreeBSD](https://www.freebsd.org/)    |No|Not Linux, different OS|
| 24|[Solus](https://getsol.us/)            |No|Distro not supported|
| 25|[SparkyLinux](https://sparkylinux.org/)|OK||
| 26|[BigLinux](https://sparkylinux.org/)   |OK||
| 27|[Alpine](https://www.alpinelinux.org/)|OK||
| 28|[CentOS](https://www.centos.org/)      |||
| 29|[Q4OS](https://q4os.org/)              |OK||
| 30|[Lite](https://www.linuxliteos.com/)   |OK||
| 31|[Puppy](https://puppylinux-woof-ce.github.io/)|No|Distro not supported|
| 32|[EasyOS](https://easyos.org/)          |No|Distro not supported||
| 33|[Tails](https://tails.net/)            |OK||
| 34|[Kubuntu](https://kubuntu.org/)        |OK||
| 35|[OpenMandriva](https://www.openmandriva.org/)  |No|Distro not supported|
| 36|[deepin](https://www.deepin.org/index/en)  |OK||
| 37|[Linuxfx](https://distrowatch.com/table.php?distribution=linuxfx)  |OK||
| 38|[PCLinuxOS](https://pclinuxos.com/)    |No|Distro not supported|
| 39|[Voyager](https://voyagerlive.org/)    |OK||
| 40|[Parrot](https://parrotsec.org/)       |OK||
| 41|[Rocky](https://rockylinux.org/)       |OK||
| 42|[Lubuntu](https://lubuntu.me/)         |OK||
| 43|[Slackware](http://www.slackware.com/) |No|Distro not supported|
| 44|[PorteuX](https://www.porteus.org/)   |No||Distro not supported|
| 45|[Devuan](https://www.devuan.org/)|OK||
| 46|[ALT](https://getalt.org/)             |No|Distro not supported|
| 47|[DragonOS](https://sourceforge.net/projects/dragonos-focal/)|OK||
| 48|[Red Hat](https://redhat.com)          |OK|To be tested|
| 49|[Ultimate](https://ultimateedition.info/)|OK|To be tested|
| 50|[ReactOS](https://reactos.org/)        |No|Not Linux, different OS|
| 51|[Xubuntu](https://xubuntu.org/)        |OK||
| 52|[KaOS](https://kaosx.us/)              |No|Distro not supported| 
| 53|[Chimera](https://chimera-linux.org/)  |No|Distro not supported| 
| 54|[Archcraft](https://archcraft.io/)     |OK|To be tested|
| 55|[Vanilla](https://vanillaos.org/)      |OK|To be tested|
| 56|[Gentoo](https://www.gentoo.org/)      |No|Distro not supported| 
| 57|[Calculate](https://www.calculate-linux.org/)  |No|Distro not supported| 
| 58|[Commodore](https://www.commodore.net/)|OK|To be tested|
| 59|[Arch](https://archlinux.org/)         |OK||
| 60|[Feren](https://ferenos.weebly.com/)   |OK||
| 61|[Peppermint](https://peppermintos.com/)|OK||
| 62|[RebornOS](https://rebornos.org/)      |OK|To be tested|
| 63|[blendOS](https://blendos.co/)         |OK|To be tested|
| 64|[Mageia](https://www.mageia.org)       |No|Distro not supported|
| 65|[Rhino](https://rhinolinux.org/)       |OK|To be tested|
| 66|[Bodhi](https://www.bodhilinux.com/)   |OK||
| 67|[FunOS](https://funos.org/)            |OK||
| 68|[GhostBSD](https://www.ghostbsd.org/)  |No|Not Linux, different OS|
| 69|[Nitrux](https://nxos.org/)            |No|Distro not supported|
| 70|[wattOS](https://www.planetwatt.com/)  |OK||
| 71|AV Linux|||
| 72|Kodachi|||
| 73|Mabox|OK||
| 74|SDesk|||
| 75|Artix|OK||
| 76|Qubes|||
| 77|Regata|||
| 78|ArchBang|||
| 79|Emmabuntüs|OK||
| 80|Tiny Core|No|Distro not supported|
| 81|Oracle|--|Never tested|
| 82|Murena|||
| 83|4MLinux|||
| 84|Bazzite|||
| 85|AUSTRUMI|||
| 86|Ultramarine|OK||
| 87|TrueNAS|||
| 88|Ubuntu MATE|OK||
| 89|MakuluLinux|OK||
| 90|Ubuntu Studio|OK||
| 91|Proxmox|OK||
| 92|Void|No|Distro not supported|
| 93|OpenBSD|No|Not Linux, different OS|
| 94|PikaOS|||
| 95|Dr.Parted|||
| 96|Damn Small|OK||
| 97|Haiku|||
| 98|BunsenLabs|OK||
| 99|Endless|||
|100|Porteus|||