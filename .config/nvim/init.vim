
"'hardmode'
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>


" user configs
let mapleader=" "
let maplocalleader="\\"

nnoremap <leader>fd :exe 'edit '.stdpath('config').'/init.vim'<cr>
nnoremap <leader>st :silent exec "!stt zsh" <cr>
nnoremap <leader>t :tabnew <cr>
nnoremap <leader>w :w <cr>
nnoremap <leader>n :noh <cr>
nnoremap <leader>p "+p <cr>
nnoremap <leader>yy "+yy <cr>
vnoremap <leader>y "+y <cr>

" mpc player shortcuts

let port=6601

nnoremap <leader>P <cr>
nnoremap <leader>PP :silent exec "!mpc toggle -p " port<cr>
nnoremap <leader>P< :silent exec "!mpc prev -p " port<cr>
nnoremap <leader>P> :silent exec "!mpc next -p " port<cr>
nnoremap <leader>Pz :silent exec "!mpc shuffle -p " port<cr>
nnoremap <leader>Po :silent exec "!mplay"<cr>

nnoremap <leader>fx :silent exec "!chmod +x %"<cr>
autocmd Filetype vim nnoremap <LocalLeader>s :source %<cr> 

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

set statusline= 
set statusline+=\ %F
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%=
set statusline+=%c\:%l/%L
set statusline+=\ [%p%%]
set statusline+=\ [%{strftime('%T')}]

filetype on
filetype indent on
filetype plugin on

set expandtab

call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround' 
Plug 'dylanaraps/wal.vim', { 'as' : 'pywal' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'zaptic/elm-vim'
Plug 'luochen1990/rainbow'
Plug 'wlangstroth/vim-racket'

call plug#end()


if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif

colorscheme dracula

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:livepreview_previewer = 'zathura'

