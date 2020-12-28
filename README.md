# Backup of my neovim preferences
<p align="center">
  <img src="data/screenshot.png?v=1"/>
</p>

### Target installation
```
~/.config/nvim/init.vim
```

### Requirements

#### Install Powerline fonts:
```
https://github.com/powerline/fonts
```

#### Install system requirements for coc (autocomplete support in vim):
```
# (python) make sure nodejs 12+ is available in the PATH

# (rust) install racer to the system:
cargo +nightly install racer

# (rust) add rust source code to the system:
rustup component add rust-src
```

#### Install Neovim:
```
https://neovim.io
```

#### Install vim-plug:
```
https://github.com/junegunn/vim-plug
```
> linux: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Run the plugins installation inside nvim:
```
:PlugInstall
```

### Optional
####  Install font `JetBrains Mono`:
```
https://www.jetbrains.com/lp/mono/#design
```

####  Install `Kitty`:
```
https://github.com/kovidgoyal/kitty
```

####  Install `Kitty themes` `(kitty-themes/themes/Galaxy.conf)`:
```
https://github.com/dexpota/kitty-themes
```

#### Add the config to kitty `~/.config/kitty/kitty.conf` (`ctrl + shift + F2`):
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

#### Make Kitty the default xterminal:
```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --config x-terminal-emulator
```

#### Bashrc defaults (`~/.bashrc`):
```
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# using 'v' to call vim
alias v='nvim'

# avoiding to create python's pyc|__pycache__ during the dev environment.
export PYTHONDONTWRITEBYTECODE=1
```

#### Inputrc defaults (`~/.inputrc`):
```
# arrow up/down to auto-complete based on the history
"\e[A":history-search-backward
"\e[B":history-search-forward

# control arrow left/right to move the cursor between words
"\e[1;5C": forward-word
"\e[1;5D": backward-word
"\e[5C": forward-word
"\e[5D": backward-word
"\e\e[C": forward-word
"\e\e[D": backward-word
```

#### Map `capslock` to `esc`:
Add the line below to the `~/.profile` (capslook gets in the way when using vim and at same time esc can be "hard" to reach by doing this it fixes two potential issues):
```bash
setxkbmap -option caps:escape
```

### Licence
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
