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
> linux: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Run the plugins installation inside nvim:
```
:PlugInstall
```

Run the installation for YouCompleteMe (`python3 ~/.local/share/nvim/plugged/youcompleteme/install.py`):
```
https://github.com/Valloric/YouCompleteMe#installation
```

### Optional
Install font `JetBrains Mono`:
```
https://www.jetbrains.com/lp/mono/#design
```

Install `Kitty`
```
https://github.com/kovidgoyal/kitty
```

Add the config to kitty `~/.config/kitty` (`ctrl + shift + F2`):
```
include ./theme.conf

font_family      JetBrains Mono
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0

enable_audio_bell no
draw_minimal_borders yes
tab_bar_style separator
active_tab_background #eee

map shift+enter send_text all \x1b[13;2u
map ctrl+enter send_text all \x1b[13;5u
```

Map `capslock` to `esc` by adding the line below to your `~/.profile` (capslook gets in the way when using vim and at same time esc can be "hard" to reach by doing this it fixes two potential issues):
```bash
setxkbmap -option caps:escape
```

I use the alias `v` to launch nvim, added to `~/.bashrc`:
```bash
alias v='nvim'
```

### Licence
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
