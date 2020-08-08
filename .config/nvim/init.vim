
"'hardmode'
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" important set's

set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
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

" filetype

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Plugin install

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround' 

Plug 'luochen1990/rainbow'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'itchyny/lightline.vim'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'zaptic/elm-vim'
Plug 'wlangstroth/vim-racket'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'

Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let mapleader=" "
let maplocalleader="\\"

" lightline

set laststatus=2
set noshowmode

let g:lightline = {
      \   'colorscheme': 'powerline',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead'
      \   },
      \ }

" Rust vim

let g:rustfmt_autosave = 1

" ale (if i want to install ale again)

let g:ale_linters = {'racket': ['raco']}
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

" COC

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
nmap <C-P> :GFiles<cr>
nmap <C-M-P> :Files<cr>

nmap <leader>fx :silent exec "!chmod +x %"<cr>

imap <LocalLeader><C-l> λ
imap <LocalLeader><C-e> €

" AUTOCMD
au Filetype vim nnoremap <LocalLeader>s :source %<cr> 
au Filetype rust nnoremap <LocalLeader>r :Crun<cr> 

au BufReadPre *.rkt[l] set filetype=racket
au filetype racket
      \ set lisp |
      \ set autoindent

" coisas aleatorias relativas a C-c C-v
vmap <LeftRelease> "*ygv
imap <S-Insert> <C-R>*

