"
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
set softtabstop=4
set shiftwidth=4
set foldcolumn=1
set encoding=utf-8
set ignorecase
set smartcase
set showmatch
set autoindent
set smartindent
set noswapfile
set laststatus=2
set noshowmode
"set signcolumn=number
set shortmess+=c
set completeopt=menuone,noinsert,noselect
set pumheight=7
set termguicolors

set clipboard+=unnamedplus

set list
set listchars=tab:\!·,trail:·,eol:¬

set syntax=ON
syntax enable

set expandtab

set path=.,**
set wildmenu
set wildignore=*/__pycache__/*,*.pyc,*/target/*,*/node_modules/*

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

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

let mapleader=" "
let maplocalleader="\\"

" filetype

filetype plugin indent on


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
nmap <leader>fp :silent exec 'edit '.stdpath('config').'/plugins.vim'<cr>
nmap <leader>st :silent exec "!stt zsh" <cr>
nmap <leader>t :tabnew <cr>
nmap <leader>n :noh <cr>
"nmap <leader>p "+p <cr>
nmap <leader>yy "+yy <cr>
vmap <leader>y "+y <cr>
nmap <leader>' <C-w>s<C-w>j:terminal<cr>
nmap <C-P> :Files<cr>
nmap <C-M-P> :GFiles<cr>
nmap <C-SPACE> <C-^><cr>
" change directory to current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" selecionar todo o arquivo
nmap <C-M-A> mtggyG'tzz<cr>

nmap <leader>fx :silent exec "!chmod +x %"<cr>

imap <C-l> λ
imap <LocalLeader><C-e> €


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" AUTOCMD
au Filetype vim nnoremap <LocalLeader>s :so %<cr> 
au Filetype rust nnoremap <LocalLeader>r :Crun<cr> 

" au filetype haskell set include=^\\s*import\\s*\\(qualified\\|\\)\s*\\zs\\(\\S\\+\\)

au BufReadPre *.rkt[l] set filetype=racket
au filetype sicp set filetype=racket
au filetype racket
      \ set lisp |
      \ set autoindent

" coisas aleatorias relativas a C-c C-v
vmap <LeftRelease> "*ygv
imap <S-Insert> <C-R>*

" imap ( ()<esc>i
" imap { {}<esc>i
" imap [ []<esc>i

command! -nargs=* Make :exec 'make'

exec 'source '.stdpath('config').'/plugins.vim'
