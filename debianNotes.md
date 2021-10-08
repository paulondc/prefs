### Add my user to the sudoers list (requires a restart)
```
/sbin/usermod -aG sudo <user>
```

### Edit Grub
Edit the file `/etc/default/grub` to add the grub options below:
```
GRUB_TIMEOUT=10
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_DISABLE_SUBMENU=y
GRUB_DISABLE_RECOVERY=true
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

#### Update debian to get to testing mode
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
