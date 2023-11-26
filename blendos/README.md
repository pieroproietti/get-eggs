# BlendOS

* adapt `system.yaml`
* run `./install.sh`
* install will add run `pacman -Sy akshara` and `akshara update`
* Add `akshara` after `base udev` in `/etc/mkinitcpio`
* `sudo mkinitcpio -P; sudo akshara update`
* reboot.


