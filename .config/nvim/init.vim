" Welcome Humans
"
" TODO:
" LEARN: surround, emmet, harpoon, vim-fugitive


"" DUNNO
syntax on

filetype indent on
filetype plugin on


"" SETS
set exrc

set autoindent
set smartindent

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set colorcolumn=80
set guicursor=
set nohlsearch
set nowrap
set scrolloff=10
set sidescrolloff=10

set signcolumn=yes:2
set splitbelow

set hidden
set incsearch
set noerrorbells

set number
set relativenumber


set directory=~/.vim/dirs/tmp
set backup
set backupdir=~/.vim/dirs/backups
set undofile
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif


"" REMAPS
let mapleader = " "

"" - Visual Indent
vmap > >gv
vmap < <gv

"" - Buffers
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <Tab> :bn<CR>


"" PLUGINS
call plug#begin('~/.vim/plugged')

"" - Get Good


"" - Autocompletion
" NOTE: Coc requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

"" - File Management
" NOTE: Telescope requires ripgrep for live_grep and grep_string
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } "Suggested
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "For preview
Plug 'ThePrimeagen/harpoon'

"" - Code Commenter
Plug 'tpope/vim-commentary'

"" - Git Stuff
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/changesPlugin'

"" - Syntax Highlighting
Plug 'vim-syntastic/syntastic'

"" - Python Stuff
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-dotenv'

"" - Misc
"" NOTE: Needs Go Lang
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()


"" CUSTOM STUFF
let g:is_copy_mode = v:false

function! Copymode() abort
  if g:is_copy_mode
    set number relativenumber signcolumn=yes:2
    let g:is_copy_mode = v:false
  else
    set nonumber norelativenumber signcolumn=no
    let g:is_copy_mode = v:true
  endif
endfunction

nn <silent> <C-c> :call Copymode()<CR>


au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2
  \ set softtabstop=2
  \ set shiftwidth=2

"" AUTOCOMMANDS
if has("autocmd")
  augroup FileTypeDetect
    au BufEnter *.markdown,*.mkd,*.md setl wrap tw=79
    au BufEnter *.json setl ft=javascript
    au BufEnter *.py setl ts=4 sw=4 sts=4
    au BufEnter *.js setl ts=2 sw=2 sts=2
    au BufEnter *.html setl ts=4 sw=4 sts=4
  augroup END

  " Automatically removing all trailing whitespace
  au BufWritePre * %s/\s\+$//e
  " Automatically removing newlines at the end
  " au BufWritePre * %s/\n\+\%$//
  " Automatically set a newline to just one at the end
  " au BufWritePre * %s/\(\S\)\%$/\1\r/

  " Disable paste mode when leaving Insert Mode
  au InsertLeave * set nopaste
endif

