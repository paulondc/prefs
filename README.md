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

Neovim:
```
https://neovim.io
```

Install vim-plug:
```
https://github.com/junegunn/vim-plug
```

Run the plugins installation inside nvim:
```
:PlugInstall
```

Run the installation for YouCompleteMe:
```
https://github.com/Valloric/YouCompleteMe#installation
```

### Optional
I run nvim through nvim-qt (avoiding issues related with font-rendering/key-bindings that may occur when running through a console application:
```
https://github.com/equalsraf/neovim-qt
```

Also, I use the alias `v` to launch nvim-qt, added to the `~/.bashrc`:
```bash
alias v='nvim-qt'
```

### Licensing
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
