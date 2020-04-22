" 'hardmode'
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" windows integration
set mouse=a

" normal configs
let mapleader=";"

nnoremap <leader>fd :exe 'edit '.stdpath('config').'/init.vim'<cr>
nnoremap <leader>st :! stt <cr>
nnoremap <leader>t :tabnew <cr>
nnoremap <leader>w :w <cr>
nnoremap <leader>q :q <cr>

autocmd Filetype vim nnoremap <leader>sof :source %<cr> 

vmap <LeftRelease> "*ygv
imap <S-Insert> <C-R>*

set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4

syntax enable

set path+=**
set wildmenu 

filetype plugin on
call plug#begin(stdpath('data') . '/plugged')

Plug 'jceb/vim-orgmode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround'

call plug#end()

colorscheme dracula
