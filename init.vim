" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git$', '.coverage']

" status bar
" required fonts:
" https://github.com/powerline/fonts
" sudo apt-get install fonts-powerline
Plug 'vim-airline/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'brooth/far.vim'
Plug 'matze/vim-move'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
let g:far#highlight_match = 0
let g:far#auto_preview = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0

" move selection
let g:move_key_modifier = 'C'
vmap <C-down> <Plug>MoveBlockDown
vmap <C-up> <Plug>MoveBlockUp

" instructions to install python packages:
" https://neovim.io/doc/user/provider.html#provider-python
" pip2 install --user --upgrade neovim
" sudo apt install build-essential cmake python-dev python3-dev
" # add node and npm to PATH in .bashrc
" cd ~/.local/share/nvim/plugged/youcompleteme
" ./install.py --clang-completer --js-completer --enable-coverage
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'

" json
Plug 'elzr/vim-json'

" git
Plug 'tpope/vim-fugitive'

" show git diff as column
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable

" disable folding
set nofoldenable

" colorscheme tender
colorscheme onedark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" show line numbers
set number

" keeping 5 lines below the current line
set scrolloff=5

" clipboard
set clipboard+=unnamedplus

" code completing using custom python interpreter (looking under the PATH)
let g:ycm_python_binary_path = 'python'

" get rid of trailling white spaces on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" tabs
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Enable spell checking
" set spell

" Spell checking languages
set spelllang=en

" f1 toggle nerdtree
nmap <F1> :NERDTreeToggle<CR>

" traditional tabs
vmap <Tab> >gv
vmap <S-Tab> <gv

" using ESC to leave the insert mode when inside of term
tnoremap <Esc> <C-\><C-n>

" clear hightlight
nnoremap <esc><esc> :noh<return>

" making sure the option inside of the popup of youcompleteme can be selected
" hitting enter
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" jump to a buffer where it is (in another window, another tab) instead of replacing the current buffer
set switchbuf=useopen,usetab

" nnoremap ,gl :YcmCompleter GoToDeclaration<CR>
nnoremap <C-Enter> :YcmCompleter GoToDeclaration<CR>
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_goto_buffer_command = 'new-tab'

" removing the autocomplete preview displayed on top
set completeopt-=preview

" slow multiple_cursors & YCM
function Multiple_cursors_before()
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist
  let g:ycm_filetype_whitelist = {}
  set foldmethod=manual
endfunction

function Multiple_cursors_after()
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
  set foldmethod=syntax
endfunction

" term: hide line numbers and start in insert mode
function! TermModeDefauts()
  set norelativenumber
  set nonumber
  startinsert
endfunc
autocmd TermOpen * :call TermModeDefauts()

" split window to a terminal
function! SplitWindowToTerm()
  belowright split
  resize -8
  term
endfunc
nnoremap <C-T> :call SplitWindowToTerm()<CR>

" Background colors for active vs inactive windows
hi ActiveWindow guibg=#282c34
hi InactiveWindow guibg=#22262e

" change highlight group of active/inactive windows
augroup WindowManagement
  autocmd!
  autocmd WinNew * call HandleHighlight()
  autocmd WinLeave * call HandleHighlight()
  autocmd WinEnter * call HandleHighlight()
augroup END

function! HandleHighlight()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

" NERDTree open automatically when launching vim from a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
