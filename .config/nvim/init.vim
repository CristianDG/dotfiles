
"'hardmode'
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" editor configs
let mapleader=" "
let maplocalleader="\\"

" mpc player shortcuts

let port=6601

nnoremap <leader>P <cr>
nnoremap <leader>PP :silent exec "!mpc toggle -p " port<cr>
nnoremap <leader>P< :silent exec "!mpc prev -p " port<cr>
nnoremap <leader>P> :silent exec "!mpc next -p " port<cr>
nnoremap <leader>Pz :silent exec "!mpc shuffle -p " port<cr>
nnoremap <leader>Po :silent exec "!mplay"<cr>



nmap <leader>fd :silent exec 'edit '.stdpath('config').'/init.vim'<cr>
nmap <leader>st :silent exec "!stt zsh" <cr>
nmap <leader>t :tabnew <cr>
nmap <leader>w :w <cr>
nmap <leader>n :noh <cr>
nmap <leader>p "+p <cr>
nmap <leader>yy "+yy <cr>
vmap <leader>y "+y <cr>
nmap <leader>' <C-w>s<C-w>j:terminal<cr>

nnoremap <leader>fx :silent exec "!chmod +x %"<cr>

autocmd Filetype vim nnoremap <LocalLeader>s :source %<cr> 

au BufReadPost *.rkt,*.rktl set filetype=racket
au filetype racket set lisp
au filetype racket set autoindent

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

set list
set listchars=tab:\!·,trail:·,eol:¬

set syntax=ON
syntax enable

set path+=**
set wildmenu


" Statusline

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
filetype plugin indent on

set expandtab

call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround' 
Plug 'dylanaraps/wal.vim', { 'as' : 'pywal' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'zaptic/elm-vim'
Plug 'luochen1990/rainbow'
Plug 'wlangstroth/vim-racket'
Plug 'neovimhaskell/haskell-vim'
Plug 'morhetz/gruvbox'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

call plug#end()


let g:gruvbox_contrast_dark="medium"

colorscheme dracula


let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:livepreview_previewer = 'zathura'

