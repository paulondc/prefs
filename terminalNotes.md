####  Install [Kitty](https://sw.kovidgoyal.net/kitty):
```
https://github.com/kovidgoyal/kitty
```

Install Kitty themes (`~/.config/kitty/themes`):
```
https://github.com/dexpota/kitty-themes
```
>  Ps: download the repo as zip then only extract (drag n' drop) the themes directory under: ~/.config/kitty

Make Kitty the default xterminal:
```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --config x-terminal-emulator
```

Add the config to kitty (`~/.config/kitty/kitty.conf` or `ctrl + shift + F2`):
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

# using the alias'v' for vim
alias v='nvim'

# making nvim the default viewer for man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if status is-interactive
    # Commands to run in interactive sessions can go here
end
```

#### Shell option B: Bash
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
