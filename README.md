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

Run coc installs (autocomplete support):
```
# install tserver by running the command in nvim:
CocInstall coc-json coc-tsserver

# (rust dependency) install racer in the system:
cargo +nightly install racer

# (rust dependency) add rust source code in the system:
rustup component add rust-src

# install rust autocomplete support by running the command in nvim:
CocInstall coc-rust-analyzer

# install python autocomplete support by running the command in nvim (require nodejs 12+):
CocInstall coc-pyright
```

YCM-Generator needs to be patched (`~/.local/share/nvim/plugged/YCM-Generator/config_gen.py`):
```
https://github.com/rdnetto/YCM-Generator/issues/119#issuecomment-464622499
```

### Optional
Install font `JetBrains Mono`:
```
https://www.jetbrains.com/lp/mono/#design
```

Install `Kitty`:
```
https://github.com/kovidgoyal/kitty
```

Install `Kitty themes` `(kitty-themes/themes/Galaxy.conf)`:
```
https://github.com/dexpota/kitty-themes
```

Add the config to kitty `~/.config/kitty/kitty.conf` (`ctrl + shift + F2`):
```
include ./kitty-themes/themes/Galaxy.conf

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

I use the alias `v` to launch nvim, added to `~/.bashrc`:
```bash
alias v='nvim'
```

Map `capslock` to `esc` by adding the line below to your `~/.profile` (capslook gets in the way when using vim and at same time esc can be "hard" to reach by doing this it fixes two potential issues):
```bash
setxkbmap -option caps:escape
```

### Licence
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
