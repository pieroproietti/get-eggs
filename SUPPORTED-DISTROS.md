# SUPPORTED DISTROS

I just take the list from [distrowatch](https://distrowatch.com/), to get an idea where we are.

Most of the information comes from direct experience, even from some time ago, and there may be errors. For example, some time ago Garuda could be remastered by removing the garuda-dracut package, but now it cannot.

If you have different results, or know more, you can report it in the [issues](https://github.com/pieroproietti/get-eggs/issues).


The order reflect Page Hit Ranking at 2025 luly, 28:

| Rank | Distro | Status | Note |
|------|--------|--------|------|
|   1 | CachyOS | OK| You need to: edit `/etc/os-release` and insert the line: `ID_LIKE=arch`, then create a symlink: `ln -s /boot/initramfs-initramfs.img /boot/initramfs-$(uname -r).img`|
|  2|Mint| OK|
|  3|MX Linux| OK| I suggest to remove mx-installer and mx-snapshot|
|  4|EndeavourOS|OK||
|  5|Debian|OK||
|  6|Pop!_OS|OK||
|  7|Manjaro|OK||
|  8|Ubuntu|OK||
|  9|Fedora|OK||
| 10|Zorin|OK||
| 11|openSUSE|OK| calamares on the repos is not complete, use krill to install|
| 12|Nobara|No| calamares on the repos is not complete, and installation with krill don't boot too|
| 13|elementary|OK||
| 14| NixOS|No|Distro not supported|
| 15|KDE neon|OK||
| 16|AnduinOS|OK||
| 17|TUXEDO|||
| 18|antiX|OK||
| 19|Bluestar|OK||
| 20|Garuda|No|It use dracut to build initramfs and its package `garuda-dracut` conflict with `mkinitcpio`|
| 21|AlmaLinux|OK|version 9.6|
| 22|Kali|OK||
| 23|FreeBSD|--|Not Linux, different OS|
| 24|Solus|--|--|
| 25|SparkyLinux|OK||
| 26|BigLinux|OK||
| 27|Alpine|OK||
| 28|CentOS|--|--|
| 29|Q4OS|OK||
| 30|Lite|OK||
| 31|Puppy|--|Distro not supported|
| 32|EasyOS|OK||
| 33|Tails|OK||
| 34|Kubuntu|OK||
| 35|OpenMandriva|No|Distro not supported|
| 36|deepin|OK||
| 37|Linuxfx|OK||
| 38|PCLinuxOS|No|Distro not supported|
| 39|Voyager|--|--|
| 40|Parrot|OK||
| 41|Rocky|OK||
| 42|Lubuntu|OK||
| 43|Slackware|No|Distro not supported|
| 44|PorteuX|--|--|
| 45|Devuan|OK||
| 46|ALT|||
| 47|DragonOS|||
| 48|Red Hat|--|Never tested|
| 49|Ultimate|||
| 50|ReactOS|No|Not Linux, different OS|
| 51|Xubuntu|OK||
| 52|KaOS|No|Distro not supported| 
| 53|Chimera|||
| 54|Archcraft
| 55|Vanilla|||
| 56|Gentoo|No|Distro not supported| 
| 57|Calculate|||
| 58|Commodore|||
| 59|Arch|OK||
| 60|Feren|||
| 61|Peppermint|OK||
| 62|RebornOS|OK||
| 63|blendOS|||
| 64| Mageia|--|Distro not supported|
| 65|Rhino|OK||
| 66|Bodhi|OK||
| 67|FunOS|--|Distro not supported|
| 68|hostBSD: Another OS
| 69|Nitrux|--|Distro not supported|
| 70|wattO|||
| 71|AV Linux|||
| 72|Kodachi|||
| 73|Mabox|OK||
| 74|SDesk|||
| 75|Artix|OK||
| 76|Qubes|||
| 77|Regata|||
| 78|ArchBang|||
| 79|Emmabuntüs|OK||
| 80|Tiny Core|--|Distro not supported|
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