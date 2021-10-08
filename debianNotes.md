### Add my user to the sudoers list (requires a restart)
```
/sbin/usermod -aG sudo <user>
sudo reboot
```

### Edit Grub
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

### Edit sources list (skip this if you don't want to run on DebianTesting)
> Running debian on testing mode: https://wiki.debian.org/DebianTesting

Replace the contents of the file `/etc/apt/sources.list` to:
```
# Debian main repos
deb https://deb.debian.org/debian/ testing main contrib non-free
deb-src https://deb.debian.org/debian/ testing main contrib non-free

deb https://deb.debian.org/debian-security testing-security main contrib non-free
deb-src https://deb.debian.org/debian-security testing-security main contrib non-free

deb https://deb.debian.org/debian/ testing-updates main contrib non-free
deb-src https://deb.debian.org/debian/ testing-updates main contrib non-free
```

#### Update debian to get into DebianTesting
```
apt update && apt dist-upgrade
```

### Install nvidia-driver (if needed)
```
apt install nvidia-driver firmware-misc-nonfree
```

### Add steam
```
dpkg --add-architecture i386
apt update
apt install steam
```

#### Install nvidia driver libs for 386 (if needed)
```
apt install nvidia-driver-libs:i386
```

### Finish
```
apt autoremove
sudo reboot
```
