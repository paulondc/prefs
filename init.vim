" specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'paulondc/vim-nerdtree-open-externally'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = [
\ 'build',
\ 'target',
\ '.coverage',
\ '__pycache__',
\ '\.pyc$',
\ '\.git$',
\ '.lock',
\ ]

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" display markers as a separated column beside of the line number
Plug 'kshenoy/vim-signature'

" color schemes (loaded later)
Plug 'rafi/awesome-vim-colorschemes'

" search and replace highlight
Plug 'osyo-manga/vim-over'

" nice defaults settings for vim
Plug 'tpope/vim-sensible'

" auto tab based on the current file
Plug 'tpope/vim-sleuth'

" full path fuzzy file, buffer finder
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v(\.git|node_modules|__pycache__|build|target|htmlcov|dist)$',
\ 'file': '\v\.(swp|ico|git|pyc|lock)$',
\ }

let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
\ 'AcceptSelection("t")': ['<cr>'],
\ }

" syntax highlight for Hjson
Plug 'hjson/vim-hjson'

" ejs syntax highlight
Plug 'nikvdp/ejs-syntax'

" css color highlight
Plug 'ap/vim-css-color'

" pgsql syntax highlight
Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

" surround extension for vim
Plug 'tpope/vim-surround'

" search and replace across multiple files
Plug 'brooth/far.vim'
let g:far#auto_preview = 0

" move block selection
Plug 'matze/vim-move'
let g:move_key_modifier = 'C'
vmap <C-down> <Plug>MoveBlockDown
vmap <C-up> <Plug>MoveBlockUp

" comment/uncomment selected lines by hitting: ctrl + /
Plug 'tpope/vim-commentary'
" README: neovim on linux pressing <C-/> registers as <C-_>
nmap <C-_> <Plug>Commentary
vmap <C-_> <Plug>Commentary

" auto complete support
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

" multiple cursors support
Plug 'terryma/vim-multiple-cursors'

" get rid of trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_guicolor = '#263247'
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" nice way to interact with json in vim
Plug 'elzr/vim-json'

" show git diff as column
Plug 'airblade/vim-gitgutter'

" initializing plugin system
call plug#end()

" if you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" enabling theme
syntax enable
colorscheme onedark " deus

" disable folding
set nofoldenable

" improving scrolling speed in large files
set lazyredraw
set regexpengine=1

" show line numbers
set number

" keeping 5 lines below the current line
set scrolloff=5

" clipboard
set clipboard+=unnamedplus

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

" enable spell checking (z= to show suggestions)
set spell

" spell checking languages
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

" jump to a buffer where it is (in another window, another tab) instead of
" replacing the current buffer
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

" background colors for active vs inactive windows
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
endfunc

" nerd tree opens automatically when launching vim from a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
      \ | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && tabpagenr() > 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

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

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space()
      \ ? "\<Tab>" : coc#refresh()

" symbol renaming
nmap <silent>rn <Plug>(coc-rename)

" formatting selected code
xmap <silent>f <Plug>(coc-format-selected)
