" VIM
set clipboard=unnamedplus
set colorcolumn=80
set encoding=utf-8
set expandtab
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

syntax on


" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

call plug#end()


" NETRW
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_altv=1

