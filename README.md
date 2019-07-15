# Backup of my neovim preferences
<p align="center">
  <img src="data/screenshot.png?v=1"/>
</p>

### Target installation
```
~/.config/nvim/init.vim
```

### Requirements

Powerline fonts:
```
https://github.com/powerline/fonts
```
> arch linux: pacman -S powerline powerline-fonts

Neovim:
```
https://neovim.io
```
> arch linux: pacman -S neovim python-neovim

Install vim-plug:
```
https://github.com/junegunn/vim-plug
```
> linux: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Run the plugins installation inside nvim:
```
:PlugInstall
```

Run the installation for YouCompleteMe (`~/.local/share/nvim/plugged/youcompleteme/install.sh`):
```
https://github.com/Valloric/YouCompleteMe#installation
```

### Optional
Map `capslock` to `esc` by adding the line below to your `~/.profile` (capslook gets in the way when using vim and at same time esc can be "hard" to reach by doing this it fixes two potential issues):
```bash
setxkbmap -option caps:escape
```

I run nvim through nvim-qt to avoid potential issues related with font-rendering/key-bindings that may occur when running through a console application:
```
https://github.com/equalsraf/neovim-qt
```

Also, I use the alias `v` to launch nvim-qt, added to `~/.bashrc`:
```bash
alias v='nvim-qt --no-ext-tabline'
```

### Licence
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
