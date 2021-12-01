" Welcome Humans
"
" TODO: vimwiki, vim-fugitive
" LEARN: surround, emmet, harpoon


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
set signcolumn=yes
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

"" - Buffers
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <Tab> :bn<CR>


"" PLUGINS
call plug#begin('~/.vim/plugged')

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
Plug 'preservim/nerdcommenter'

"" - Lsp Server
" Plug 'neovim/nvim-lspconfig'

"" - Other Stuff
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

call plug#end()


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

  " Disable paste mode when leaving Insert Mode
  au InsertLeave * set nopaste
endif


"" CUSTOM STUFF
let g:is_copy_mode = v:false

function! Copymode() abort
  if g:is_copy_mode
    set number relativenumber signcolumn=yes
    let g:is_copy_mode = v:false
  else
    set nonumber norelativenumber signcolumn=no
    let g:is_copy_mode = v:true
  endif
endfunction

nn <silent> <C-c> :call Copymode()<CR>

" lua << EOF
" require'lspconfig'.pyright.setup{}
" EOF

