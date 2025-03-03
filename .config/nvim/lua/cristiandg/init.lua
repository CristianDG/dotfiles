require('cristiandg.remap')

vim.cmd([[

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
set rtp+=g:opamshare."/merlin/vim"
set rtp+=/home/cristiandg/.opam/5.0.0+options/share/ocp-indent/vim

let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell'
let loaded_spellfile_plugin = 1

set list
set listchars=tab:\!·,nbsp:_,trail:·

command! Spell set spell!

]])

-- {{{

-- local posix_shell_options = {
--   shellcmdflag = "-c",
--   shellpipe = "2>&1 | tee",
--   shellquote = "",
--   shellredir = ">%s 2>&1",
--   shelltemp = true,
--   shellxescape = "",
--   shellxquote = "",
-- }

local nu_shell_options = {
  shellcmdflag = "--login --stdin --no-newline -c",
  shellpipe = " | tee { to text | save --force --raw %s }",
  shellquote = "",
  shellredir = "out+err> %s",
  shelltemp = false,
  shellxescape = "",
  shellxquote = "",
}

local function set_options(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

-- check if the shell ends with "nu"
if vim.opt.shell:get():match("nu.exe$") ~= nil then
  set_options(nu_shell_options)
-- else
--   set_options(posix_shell_options)
end


-- }}}

vim.opt.spelllang = 'pt_BR'

-- TODO: trocar entre windows e linux
vim.o.makeprg = "sh build.sh"

vim.o.foldmethod = 'marker'
vim.o.foldmarker = '{{{,}}}'
vim.o.foldenable = false
vim.o.number = true
vim.o.relativenumber = false
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
if not vim.fn.has('windows') then
  vim.o.undodir= os.getenv("HOME") .. "/.local/share/nvim/undodir"
end

vim.api.nvim_create_user_command('W', function() vim.cmd('w') end, {})
vim.api.nvim_create_user_command('Q', function() vim.cmd('q') end, {})

vim.api.nvim_create_autocmd('BufEnter', {
 pattern = 'term://*',
 command = ':startinsert'
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.go',
  callback = function () vim.o.tabstop = 2 end
})

vim.cmd.colorscheme 'gruber-darker'
-- vim.cmd.colorscheme 'onedark'
-- vim.cmd.colorscheme 'simp'

