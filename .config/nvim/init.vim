" vim 'hardmode'
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" ---------------

set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4


syntax enable

set path+=**
set wildmenu 

filetype plugin on
call plug#begin('~/.local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround'

call plug#end()

colorscheme dracula


