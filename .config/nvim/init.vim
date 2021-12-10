" Welcome Humans
"
" TODO:
" LEARN: surround, emmet, harpoon, vim-fugitive


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


"" SETS but actually idk just copy pasted from ThePrimeagen
"" - Hello front end masters
set path+=**

"" - Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

"" - Ignore files
set wildignore+=*.pyc
set wildignore+=**/.git/*

"" DUNNO
syntax on

filetype indent on
filetype plugin on


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


"" REMAPS
let mapleader = " "

"" - Visual Indent
vmap > >gv
vmap < <gv

"" - Buffers
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <Tab> :bn<CR>

"" - Copying mode
nn <silent> <C-c> :call Copymode()<CR>


"" AUTOCOMMANDS
if has("autocmd")
  augroup FileTypeDetect
    au BufEnter *.markdown,*.mkd,*.md setl wrap tw=79
    " au BufEnter *.json setl ft=javascript
    " au BufEnter *.py setl ts=4 sw=4 sts=4
    " au BufEnter *.js setl ts=2 sw=2 sts=2
    " au BufEnter *.html setl ts=4 sw=4 sts=4
  augroup END

  " Automatically removing all trailing whitespace
  au BufWritePre * %s/\s\+$//e

  " Disable paste mode when leaving Insert Mode
  au InsertLeave * set nopaste
endif


" From emmet file
"autocmd FileType html,css EmmetInstall

" From coc file
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType json setl formatexpr=CocAction('formatSelected')
  " autocmd FileType json syntax match Comment +\/\/.\+$+
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"" GROUPS
" au BufNewFile,BufRead *.py
"   \ set tabstop=4
"   \ set softtabstop=4
"   \ set shiftwidth=4
"   \ set textwidth=79
"   \ set expandtab
"   \ set autoindent
"   \ set fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css
"   \ set tabstop=2
"   \ set softtabstop=2
"   \ set shiftwidth=2

