# Compatibility list

I just take the list from [distrowatch](https://distrowatch.com/), to get an idea where we are. The order reflect Page Hit Ranking at 2025 luly, 28:

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
| 12|Nobara|KO| calamares on the repos is not complete, and installation with krill don't boot too|
| 13|elementary|OK||
| 14| NixOS|--|Distro not supported|
| 15|KDE neon|OK||
| 16|AnduinOS|OK||
| 17|TUXEDO|||
| 18|antiX|OK||
| 19|Bluestar|OK||
| 20|Garuda|KO|It use dracut to build initramfs and its package `garuda-dracut` conflict with `mkinitcpio`|
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
| 35|OpenMandriva|--|Distro not supported|
| 36|deepin|OK||
| 37|Linuxfx|OK||
| 38|PCLinuxOS|KO|Distro not supported|
| 39|Voyager|--|--|
| 40|Parrot|OK||
| 41|Rocky|OK||
| 42|Lubuntu|OK||
| 43|Slackware|--|Distro not supported|
| 44|PorteuX|--|--|
| 45|Devuan|OK||
| 46|ALT|||
| 47|DragonOS|||
| 48|Red Hat|--|never tested|
| 49|Ultimate|||
| 50|ReactOS: Another OS
| 51|Xubuntu|OK||
| 52|KaOS| KO|Distro not supported| 
| 53|Chimera|||
| 54|Archcraft
| 55|Vanilla|||
| 56|Gentoo||Distro not supported| 
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
| 70|Tiny Core|--|Distro not supported|
| 80|Oracle|--|never tested|
| 81|Murena|||
| 82|4MLinux|||
| 83|Bazzite|||
| 84|AUSTRUMI|||
| 85|Ultramarine|OK||
| 86|TrueNAS|||
| 87|Ubuntu MATE|OK||
| 88|MakuluLinux|OK||
| 89|Ubuntu Studio|OK||
| 90|Proxmox|OK||
| 91|Void|--|Distro not supported|
| 92|OpenBSD|--|Not Linux, different OS|
| 93|PikaOS|||
| 94|Dr.Parted|||
| 95|Damn Small|||
| 96|Haiku|||
| 97|BunsenLabs
| 98|Endless|||
| 99|Porteus|||