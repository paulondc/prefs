" specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'
Plug 'paulondc/vim-nerdtree-open-externally'
Plug 'Xuyuanp/nerdtree-git-plugin'

let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git$', '.coverage']

" status bar
" required fonts:
" https://github.com/powerline/fonts
" sudo apt install fonts-powerline
Plug 'wincent/ferret'
Plug 'vim-airline/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-signify'
Plug 'hjson/vim-hjson'
" vim-sandwich can potentially replace vim-surround, keeping both for now
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'brooth/far.vim'
Plug 'matze/vim-move'
Plug 'nikvdp/ejs-syntax'
Plug 'tpope/vim-commentary'
" sudo apt install postgresql postgresql-contrib
Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'
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
let g:airline#extensions#tabline#fnamemod = ':t'

" ctrl+p ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules|__pycache__|build|target|htmlcov|dist)|(\.(swp|ico|git|pyc))$'

" move selection
let g:move_key_modifier = 'C'
vmap <C-down> <Plug>MoveBlockDown
vmap <C-up> <Plug>MoveBlockUp

" vim commentary
" neovim on linux pressing <C-/> registers as <C-_>
nmap <C-_> <Plug>Commentary
vmap <C-_> <Plug>Commentary

" Coc requirements:
" # (python) make sure nodejs 12+ is available in the PATH
"
" # (c/c++) clangd language server:
" sudo apt-get install clangd
"
" # cmake:
" sudo apt-get install cmake
"
" # (rust) install racer to the system:
" cargo +nightly install racer
"
" # (rust) add rust source code to the system:
" rustup component add rust-src
"
" # manual install:
" CocInstall coc-json coc-yaml coc-sh coc-tsserver coc-pairs coc-rust-analyzer coc-pyright coc-clangd coc-cmake
"
" automatic install:
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-tsserver',
\ 'coc-sh',
\ 'coc-pairs',
\ 'coc-rust-analyzer',
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-cmake',
\ ]

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }

Plug 'terryma/vim-multiple-cursors'
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'

" json
Plug 'elzr/vim-json'

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

" improving scrolling speed in large files
set lazyredraw
set regexpengine=1

" colorscheme onedark
colorscheme deus

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ctrlp_prompt_mappings = {
\   'AcceptSelection("e")': ['<2-LeftMouse>'],
\   'AcceptSelection("t")': ['<cr>'],
\}

" show line numbers
set number

" keeping 5 lines below the current line
set scrolloff=5

" clipboard
set clipboard+=unnamedplus

" get rid of trailling white spaces on save
let g:better_whitespace_guicolor='#263247'
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

" white space chars
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:.

" Enable spell checking (z= to show suggestions)
set spell

" Spell checking languages
set spelllang=en

" f1 toggle nerdtree
nmap <F1> :NERDTreeToggle<CR>

" disabling help in insert mode
imap <F1> <Nop>

" traditional tabs
vmap <Tab> >gv
vmap <S-Tab> <gv

" disabling ex mode (entering Ex mode. Type visual to go to Normal mode)...
nnoremap Q <Nop>

" using ESC to leave the insert mode when inside of term
tnoremap <Esc> <C-\><C-n>

" clear hightlight
nnoremap <esc><esc> :noh<return>

" jump to a buffer where it is (in another window, another tab) instead of replacing the current buffer
set switchbuf=useopen,usetab

" navigate in the definitions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" removing the autocomplete preview displayed on top
set completeopt-=preview

" disabling plugins during multiple cursors
function Multiple_cursors_before()
  set foldmethod=manual
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function Multiple_cursors_after()
  set foldmethod=syntax
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
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
"hi ActiveWindow guibg=#282c34
"hi InactiveWindow guibg=#22262e

" change highlight group of active/inactive windows
augroup WindowManagement
  autocmd!
  autocmd WinNew * call HandleHighlight()
  autocmd WinLeave * call HandleHighlight()
  autocmd WinEnter * call HandleHighlight()
augroup END

function! HandleHighlight()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunc

" NERDTree opens automatically when launching vim from a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && tabpagenr() > 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" update title (necessary to update nvim-qt window's title)
set title

" scroll documentation in coc autocomplete
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
