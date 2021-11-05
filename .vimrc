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

filetype indent on
filetype plugin on

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

syntax on


" PLUGINS
call plug#begin('~/.vim/plugged')

" Autocompletion
" coc must have nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Tree
Plug 'preservim/nerdtree'
" Code commenter
Plug 'preservim/nerdcommenter'
" Status line & Tab line
Plug 'vim-airline/vim-airline'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" Surround
Plug 'tpope/vim-surround'

call plug#end()

" Coc ----------------------------------------

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" NerdTree ----------------------------------------

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" NerdCommenter ----------------------------------------

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" Vim Airline ----------------------------------------

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1


