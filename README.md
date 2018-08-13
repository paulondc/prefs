# Backup of my neovim preferences

#### Target installation
```
~/.config/nvim/init.vim
```

#### Requirements

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

#### Optional
I run nvim through nvim-qt (avoiding issues with font-rendering/key-bindings that may happen with running through a console application:
```
https://github.com/equalsraf/neovim-qt
```

I use the alias `v` to launch nvim-qt, added to the `~/.bashrc`:
```bash
alias v='nvim-qt'
```
