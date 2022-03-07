" Welcome Humans


"" PLUGINS
call plug#begin('~/.vim/plugged')

"" - Autocompletion
" NOTE: Coc requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

"" - File Management
" NOTE: Telescope requires ripgrep for live_grep and grep_string
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

"" - Code Commenter
Plug 'tpope/vim-commentary'

"" - Git Stuff
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/changesPlugin' " NANI!!!!!!!!!! I think I should use git gutter

"" - Python Stuff
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-dotenv'

"" - Speed Counter?
Plug 'ThePrimeagen/vim-apm'

"" - Theme Stuff
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"" DUNNO
syntax on

filetype indent on
filetype plugin on

"" COLORSHEME STUFF
set termguicolors

colorscheme dracula

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

"" - Buffers
nnoremap <silent> <C-l> :bp<CR>
nnoremap <silent> <C-h> :bn<CR>

"" - Copying mode
nnoremap <silent> <leader>C :call Copymode()<CR>


"" AUTOCOMMANDS
if has("autocmd")

  " Automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " Disable paste mode when leaving Insert Mode
  autocmd InsertLeave * set nopaste

  " I dunno but it's Coc Stuff
  augroup CocStuff
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END

endif
