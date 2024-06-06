require('cristiandg.remap')

vim.cmd([[

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
set rtp+=g:opamshare."/merlin/vim"
set rtp+=/home/cristiandg/.opam/5.0.0+options/share/ocp-indent/vim

let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell'
let loaded_spellfile_plugin = 1

command! Spell set spell!

]])

vim.opt.spelllang = 'pt_BR'


vim.o.foldmethod = 'marker'
vim.o.foldmarker = '{{{,}}}'
vim.o.foldenable = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.tabstop=2
vim.o.softtabstop=2
vim.o.shiftwidth=2
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.expandtab = true
--vim.o.termguicolors = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
--vim.o.timeout = true
--vim.o.timeoutlen = 400

vim.o.statusline=[[%F %M %y %r%=%c:%l/%L [%p%%] |%{strftime('%T')}| ]]
vim.o.swapfile=false
vim.o.undodir= os.getenv("HOME") .. "/.local/share/nvim/undodir"

-- vim.api.nvim_create_autocmd('BufEnter', {
--  pattern = 'term://*',
--  command = ':startinsert'
-- })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.go',
  callback = function () vim.o.tabstop = 2 end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.cs',
  callback = function ()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.html',
  callback = function ()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
  end
})


