# Backup of preferences

### Desktop preferences (Gnome)
<p align="center">
  <img src="data/gnome-prefs-screenshot.png?v=2"/>
</p>

#### Install [Rofi](https://github.com/davatorium/rofi):
```
sudo apt-get install rofi
```

Rofi defaults (`~/.config/rofi/config.rasi`):
```
@theme "/usr/share/rofi/themes/android_notification.rasi"
```

####  Install [Kitty](https://sw.kovidgoyal.net/kitty):
```
https://github.com/kovidgoyal/kitty
```

Install Kitty themes `(~/.config/kitty/themes)`:
```
https://github.com/dexpota/kitty-themes

# Ps: download the repo as zip then only extract (drag n' drop) the themes directory under: ~/.config/kitty
```

Make Kitty the default xterminal:
```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --config x-terminal-emulator
```

Add the config to kitty `~/.config/kitty/kitty.conf` (`ctrl + shift + F2`):
```
include ./themes/Galaxy.conf

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

#### Download and run the [gnome-prefs](./gnome-prefs) script (found on this repo)
```
chmod +x gnome-prefs
./gnome-prefs
```

## Vim preferences
<p align="center">
  <img src="data/screenshot.png?v=1"/>
</p>

### Target installation
```
~/.config/nvim/init.vim
```

### Requirements

#### Install [Powerline fonts](https://github.com/powerline/fonts):
```
sudo apt-get install fonts-powerline
```

#### Install system requirements for Coc (autocomplete support in vim):
```
# (python) make sure nodejs 12+ is always available in the PATH when running vim (~/.bashrc)
export PATH="<SOMEWHERE>/node-<VER>-linux-x64/bin:$PATH"

# (c/c++) clangd language server:
sudo apt-get install clangd 

# cmake:
sudo apt-get install cmake

# install rust:
# https://www.rust-lang.org/tools/install
rustup default nightly

# (rust) install racer to the system:
cargo +nightly install racer

# (rust) add rust source code to the system:
rustup component add rust-src
```

#### Install system requirements for pgsql.vim:
```
sudo apt install postgresql postgresql-contrib
```

Also, it might be handy to have `libpg-dev` and `libsqlite3-dev` installed on the system:
```
sudo apt-get install libpq-dev libsqlite3-dev
```

#### Install [Neovim](https://neovim.io):
```
sudo apt-get install neovim
```

#### Install vim-plug:
```
https://github.com/junegunn/vim-plug
```
> linux: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### Run plug installation inside vim:
```
:PlugInstall
```

#### Add json configuration for Coc (`~/.config/nvim/coc-settings.json`) or `CocConfig` command inside vim:

This configuration allows errors to be reported directly in the whole line of the error (instead of having to browse up to character column)
```json
{
  "diagnostic.checkCurrentLine": true
}
```

## Extra goodies

#### Install debuggers:
```
sudo apt-get install lldb gdb
```

#### Install diff/history tools:
```
sudo apt-get install kdiff3 gitk
```

####  Install font JetBrains Mono (`~/.local/share/fonts`):
```
https://www.jetbrains.com/lp/mono/#design
```

#### Shell option A: [Fish](https://fishshell.com) (recommended)
Install fish
```bash
sudo apt-get install fish
```

Set it as default shell:
```bash
# setting fish as default shell for my user (reboot after that)
chsh -s /bin/fish
```

Fish defaults (`~/.config/fish/config.fish`):
```bash
# getting rid of the welcome message
export fish_greeting=""

# making sure neovim is the default one (I personally like to use the alias 'v' for vim)
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# making nvim the default viewer for man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if status is-interactive
    # Commands to run in interactive sessions can go here
end
```

#### Shell option B : Bash
Bashrc defaults (`~/.bashrc`)
```bash
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# using 'v' to call vim
alias v='nvim'

# avoiding to create python's pyc|__pycache__ during the dev environment
export PYTHONDONTWRITEBYTECODE=1
```

Inputrc defaults (`~/.inputrc`)
```bash
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

#### Git config defaults (`~/.gitconfig`):
```
[credential]
  helper = cache --timeout=36000000
[core]
  editor = nvim
[diff]
  guitool = kdiff3
[difftool "kdiff3"]
  trustExitCode = false
[difftool]
  prompt = false
```

### Licence
vim-prefs is free software; you can redistribute it and/or modify it under the terms of the MIT License
