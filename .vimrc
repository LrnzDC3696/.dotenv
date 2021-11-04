" VIM
set clipboard=unnamedplus
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldmethod=indent
set foldlevel=69
set guicursor=
set hidden
set incsearch
set noerrorbells
set nowrap
set nu rnu
set scrolloff=8
set shiftwidth=4
set signcolumn=yes
set splitbelow
set softtabstop=4
set tabstop=4

" https://realpython.com/vim-and-python-a-match-made-in-heaven/
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1


" end of copy paste
syntax on


" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic'

call plug#end()


" NETRW
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_altv=1

