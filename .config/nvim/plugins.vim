" Plugin install

call plug#begin(stdpath('data') . '/plugged')

" file explore
Plug 'lambdalisue/fern.vim'

" VimWiki
Plug 'vimwiki/vimwiki'

" remove a bug
Plug 'antoinemadec/FixCursorHold.nvim'

" editor config
Plug 'editorconfig/editorconfig-vim'

" qol
Plug 'tpope/vim-surround' 
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" language server
Plug 'neovim/nvim-lspconfig'

" language completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'



"Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Godot
Plug 'habamax/vim-godot'

" Toml
Plug 'cespare/vim-toml'

" html
Plug 'mattn/emmet-vim'

" reasonml
Plug 'reasonml-editor/vim-reason-plus'

" svelte
"Plug 'burner/vim-svelte'
Plug 'leafoftree/vim-svelte-plugin'

" JavaScript
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'chemzqm/vim-jsx-improve'


" latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" elm
Plug 'zaptic/elm-vim'

" racket
Plug 'wlangstroth/vim-racket'

" common lisp
Plug 'vlime/vlime', {'rtp': 'vim/'}

" haskell
"Plug 'mpickering/hlint-refactor-vim'
"Plug 'alx741/vim-hindent'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'

" idris2
Plug 'edwinb/idris2-vim'

" rust
Plug 'rust-lang/rust.vim'

" clojure
Plug 'tpope/vim-fireplace'
"Plug 'Olical/conjure', {'tag': 'v4.4.0'}

" Lisp dialects
"Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

Plug 'ionide/Ionide-vim', {
      \ 'do':  'make fsautocomplete',
      \}

" style
Plug 'gruvbox-community/gruvbox'
Plug 'artanikin/vim-synthwave84'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" cursorhold
let g:cursorhold_updatetime = 100

" Background and colorscheme

let g:gruvbox_contrast_dark="hard"

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'


"set background=dark
"colorscheme gruvbox

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:livepreview_previewer = 'zathura'
" LanguageClient

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" lightline


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
" FZF


let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Rust vim

let g:rustfmt_autosave = 1

" ale

let g:ale_linters = {'racket': ['raco']}
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

set completeopt=menu,menuone,noselect

lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
--    snippet = {
--      -- REQUIRED - you must specify a snippet engine
--      expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--      end,
--    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      ['<Tab>'] = function(fallback)
--        if cmp.visible() then
--          cmp.select_next_item()
--        else
--          fallback()
--        end
--      end,
    },
    completion = { keyword_length = 3 },
    sources = cmp.config.sources({
      { name = 'lspconfig' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local servers = {
    --'clangd',
    --'rust_analyzer',
    --'pyright',
    'tsserver',
    'vimls',
  }

  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      -- on_attach = my_custom_on_attach,
      capabilities = capabilities,
  }
  end

  -- special cases

  require('lspconfig').ghcide.setup{
    capabilities = capabilities,
    cmd={"ghcup", "--lsp"}
  }

  --require'lspconfig'.erlang_ls.setup{cmd={ "erlang_ls" }}
EOF


"Nvim lsp

" TODO: quando o lsp funcionar, adicionar de volta
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Fern
nnoremap <leader>p :Fern . -reveal=% -drawer -toggle<cr>

" Godot
let g:godot_executable="~/.local/share/Steam/steamapps/common/Godot Engine/godot.x11.opt.tools.64"

" Svelte
let g:vim_svelte_plugin_load_full_syntax = 1

" VimWiki
"let g:vimwiki_list = [{'path':'~/vimwiki','syntax': 'media'}]

" rainbow

"au Filetype scheme :RainbowToggleOff

" NvimGtk
if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'FiraCode Light 12')
endif
