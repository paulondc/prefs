## Vim
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

#### Install system requirements for [Coc](https://github.com/neoclide/coc.nvim) (autocomplete support in vim):
```bash
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

#### Install [vim-plug](https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Run plug installation inside vim:
```
:PlugInstall
```

#### Add json configuration for [Coc](https://github.com/neoclide/coc.nvim) (`~/.config/nvim/coc-settings.json`) or `CocConfig` command inside vim:

This configuration allows errors to be reported directly in the whole line of the error (instead of having to browse up to character column)
```json
{
  "diagnostic.checkCurrentLine": true
}
```
