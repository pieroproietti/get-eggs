# BlendOS

* adapt `system.yaml` default to `blendos-base`
* run `./install.sh`
* install will add [breackfast] on `/etc/pacman.conf` and run `pacman -Sy akshara` and `akshara update`
* Add `akshara` after `base udev` in `/etc/mkinitcpio.conf`
* `sudo mkinitcpio -P`
* `sudo akshara update`
* reboot.


