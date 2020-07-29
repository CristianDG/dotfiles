
"'hardmode'
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" important set's

set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=8
set foldcolumn=1
set encoding=utf-8
set ignorecase
set smartcase
set showmatch

set shortmess+=c

set clipboard+=unnamedplus

set list
set listchars=tab:\!·,trail:·,eol:¬

set syntax=ON
syntax enable

set expandtab

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

" filetype

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Plugin install

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround' 

Plug 'dense-analysis/ale'
Plug 'luochen1990/rainbow'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'

Plug 'ncm2/ncm2-vim'
Plug 'HiPhish/ncm2-vlime'
Plug 'ncm2/ncm2-syntax'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'zaptic/elm-vim'
Plug 'wlangstroth/vim-racket'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'

Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let mapleader=" "
let maplocalleader="\\"

" ale

let g:ale_linters = {'racket': ['raco']}
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1


" ncm2

let g:ncm2#total_popup_limit = 7
let g:ncm2#popup_delay = 100

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Background and colorscheme

let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox
set background=dark

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:livepreview_previewer = 'zathura'

" mpc player shortcuts
let port=6601
nnoremap <leader>P <cr>
nnoremap <leader>PP :silent exec "!mpc toggle -p " port<cr>
nnoremap <leader>P< :silent exec "!mpc prev -p " port<cr>
nnoremap <leader>P> :silent exec "!mpc next -p " port<cr>
nnoremap <leader>Pz :silent exec "!mpc shuffle -p " port<cr>
nnoremap <leader>Po :silent exec "!mplay"<cr>

" Q.O.L

nmap <leader>fd :silent exec 'edit '.stdpath('config').'/init.vim'<cr>
nmap <leader>st :silent exec "!stt zsh" <cr>
nmap <leader>t :tabnew <cr>
nmap <leader>w :w <cr>
nmap <leader>n :noh <cr>
nmap <leader>p "+p <cr>
nmap <leader>yy "+yy <cr>
vmap <leader>y "+y <cr>
nmap <leader>' <C-w>s<C-w>j:terminal<cr>
nmap <C-P> :Files<cr>

nmap <leader>fx :silent exec "!chmod +x %"<cr>

imap <LocalLeader><C-l> λ

" AUTOCMD
au Filetype vim nnoremap <LocalLeader>s :source %<cr> 

au BufReadPost *.rkt,*.rktl set filetype=racket
au filetype racket set lisp
au filetype racket set autoindent

" coisas aleatorias relativas a C-c C-v
vmap <LeftRelease> "*ygv
imap <S-Insert> <C-R>*

