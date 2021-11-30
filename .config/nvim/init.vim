" VIM
set autoindent
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldmethod=indent
set foldlevel=69
set guicursor=
set hidden
set incsearch
set noerrorbells
set noshowmode
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

let mapleader = " "

" Buffers
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <Tab> :bn<CR>

" PLUGINS
call plug#begin('~/.vim/plugged')

" Autocompletion
" coc must have nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" html stuff
Plug 'mattn/emmet-vim'
" File Management
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Code Stuff
" Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
" Code commenter
Plug 'preservim/nerdcommenter'
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


" Netrw ----------------------------------------

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_altv=1


" Telescope ----------------------------------------

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" AUTOCOMMANDS
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

vn <silent> <C-c> :w !termux-clipboard-set<CR>:echo <CR>

