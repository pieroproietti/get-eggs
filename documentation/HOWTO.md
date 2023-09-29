# how to get a colibri

I started with latest version of archiso: `archlinux-2023.09.01-x86_64.iso`.

Then, used `archinstall` to get a minimal installation. On `Disk configuration` choose `Use a best-effort deault configuration layot`, then `btrfs` or `ext4`, as you prefer.

Among the packages added: `git`, `lsb-release`, others packages will be installed later by `addaur`.

At this point, we MUST configure network, I just choose the most basic: `Copy ISO configuration to installation`.

Finally select install and wait it finish. Archinstall will propose you to chroot to continue configuration, answer yes.

Now we are chrooted and we can clone our wardrobe: 
* `git clone https://github.com/pieroproietti/addaura`

Then add AUR repository and penguins-eggs:
* `sudo addaurs/addaura.sh`.

`addaura.sh` will install few packages `bash-completion`, `dialog`, `man-db`, `nano`, `openssh` and `wget` and will add [AUR](https://aur.archlinux.org/)  repository to pacman.conf.

At last `addaur..sh` will install penguins-eggs.

* `sudo pacman -Syu penguins-eggs`.

Once eggs was installed, I proceeded to load the wardrobe and "dress" the system with the colibri costume.
* `eggs wardrobe get`
* `sudo eggs wardrobe wear colibri`

At this point after rebooting, I found myself in the colibri graphical system and proceeded to install calamares with the command: `sudo eggs calamares --install`.

Well, we are ready to remaster the system, just a little reconfiguration and cleaning before:

* `sudo eggs dad -d`
* `sudo eggs tools clean`
* `sudo eggs produce --max --addons adapt`

That's all folks!

![arch-btrfs-colibri](https://github.com/pieroproietti/penguins-eggs/assets/958613/af5bb156-c86e-422d-8ed0-f4eef82d249d)

Well, if we choose ext4 as filesystem, we finished. If we choose `btrfs` then continue.
