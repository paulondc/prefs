## Vim
<p align="center">
  <img src="data/screenshot.png?v=1"/>
</p>

#### Install [Neovim](https://neovim.io):
```
sudo apt install neovim
```

#### Install clipboard provider (arch linux)
```
sudo pacman -S xclip
```

#### Update config (`~/.config/nvim/init.vim`)

Download [init.vim](https://github.com/paulondc/prefs/blob/master/init.vim). You can get it by simply running the line bellow on the terminal :point_down:
```bash
echo 'mkdir -p ~/.config/nvim && wget https://raw.githubusercontent.com/paulondc/prefs/master/init.vim -O ~/.config/nvim/init.vim' | bash
```

### Requirements

#### Install system requirements for [Coc](https://github.com/neoclide/coc.nvim) (autocomplete support in vim):
```bash
# (python/coc) requires nodejs 12+
sudo apt install nodejs npm

# on ubuntu install "n" that manages node versions then change to the latest lts
sudo npm install -g n
sudo n lts

# (c/c++) clangd language server
sudo apt install clangd 

# cmake
sudo apt install cmake

# install rust
# https://www.rust-lang.org/tools/install
rustup default nightly

# (rust) add rust source code to the system
rustup component add rust-src
```

#### Install debuggers:
```
sudo apt-get install lldb gdb
```

#### Install system requirements for pgsql.vim:
```
sudo apt install postgresql postgresql-contrib
```

Also, it might be handy to have `libpg-dev` and `libsqlite3-dev` installed on the system:
```
sudo apt install libpq-dev libsqlite3-dev
```

#### Install [vim-plug](https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Run plug installation inside vim:
```
:PlugInstall
```

#### Add json configuration for [Coc](https://github.com/neoclide/coc.nvim) (`~/.config/nvim/coc-settings.json`) or `CocConfig` command inside vim:

This configuration allows errors to be reported directly in the whole line of the error (instead of having to browse up to character column). Increasing the maximum number of suggestions shown by the auto-complete popup (default 50). Also, disabling the type hints in python since it polutes the whole editor by mixing actual code with non code for the type hints.
```json
{
  "diagnostic.checkCurrentLine": true,
  "suggest.maxCompleteItemCount": 10000,
  "inlayHint.enable": false
}
```
