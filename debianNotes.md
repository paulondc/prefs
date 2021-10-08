<img src="data/debianLogo.png" width="256"/>

## Installation
The instructions below were based on debian's default installation options


## Post installation
### Add my user to the sudoers list (if needed)
```
/sbin/usermod -aG sudo <user>
```
> Requires a restart

### Edit sources list (skip this if not running on DebianTesting)
> Running debian on testing: https://wiki.debian.org/DebianTesting

Replace the whole contents of the file `/etc/apt/sources.list` to:
```
# Debian main repos
deb https://deb.debian.org/debian/ testing main contrib non-free
deb-src https://deb.debian.org/debian/ testing main contrib non-free

deb https://deb.debian.org/debian-security testing-security main contrib non-free
deb-src https://deb.debian.org/debian-security testing-security main contrib non-free

deb https://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src https://deb.debian.org/debian/ testing-updates main contrib non-free
```
Ps: This also includes contrib and non-free packages

#### Update debian to get into DebianTesting
```
apt update && apt dist-upgrade
```

### Edit Grub
> Nvidia: There is a very good chance of bumping to an issue related with the nvidia-driver not being supported on the latest version of the kernel available on debianTesting. Therefore, after a kernel update if the nvidia-driver does not work properly at least there is a method to select the previous kernel version in a way that the selection will persist between reboots


Edit the file `/etc/default/grub` to add the grub options below:
```
# extending the timeout so it has enough time to plug an external keyboard
# (useful when using a bluetooth keyboard as daily driver)
GRUB_TIMEOUT=10

# saving grub selection for next time
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true

# disabling the grub submenu that would list all kernel versions instead, making them 
# visible at the front selection
GRUB_DISABLE_SUBMENU=y

# removing all recovery mode entries from the grub menu (It's really rare when needed. Also,  
# this can be done through a live image too)
GRUB_DISABLE_RECOVERY=true
```

#### Reload the grub with the changes above
```
update-grub
```

### Install nvidia-driver (if needed)
```
apt install nvidia-driver firmware-misc-nonfree
```

### Finish
```
apt autoremove
sudo reboot
```

## Gaming on Steam
### Add steam (for gaming if needed)
```
dpkg --add-architecture i386
apt update
apt install steam
```

### Install nvidia driver libs for i386 (if needed)
```
apt install nvidia-driver-libs:i386
```
