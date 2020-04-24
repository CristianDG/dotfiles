
" 'hardmode'
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" user configs
let mapleader=";"

nnoremap <leader>fd :exe 'edit '.stdpath('config').'/init.vim'<cr>
nnoremap <leader>st :! stt <cr>
nnoremap <leader>t :tabnew <cr>
nnoremap <leader>w :w <cr>
nnoremap <leader>q :q <cr>

" mpc player shortcuts
nnoremap <leader>p <cr>
nnoremap <leader>pp :silent exec "!mpc toggle"<cr>
nnoremap <leader>p< :silent exec "!mpc prev"<cr>
nnoremap <leader>p> :silent exec "!mpc next"<cr>
nnoremap <leader>pz :silent exec "!mpc shuffle"<cr>
nnoremap <leader>po :silent exec "!mplay"<cr>

autocmd Filetype vim nnoremap <leader>sof :source %<cr> 

" coisas aleatorias relativas a C-c C-v
vmap <LeftRelease> "*ygv
imap <S-Insert> <C-R>*

" important set's
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set mouse=a
set ignorecase
set smartcase
set showmatch

set syntax=ON
syntax enable

set path+=**
set wildmenu 

set statusline=\ %f\ [TYPE=%Y]%=[POS=%l,%v][%p%%]\ %{strftime('%T')}\ 

filetype plugin on
call plug#begin(stdpath('data') . '/plugged')

" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround' 
Plug 'dylanaraps/wal.vim', { 'as' : 'pywal' }


call plug#end()

