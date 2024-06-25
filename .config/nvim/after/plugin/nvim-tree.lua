local ok, _ = pcall(function ()
  require('nvim-tree')
end)

if not ok then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
--require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    --width = 30,
    side = "right"
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- local api = require("nvim-tree.api")

vim.keymap.set('n', '<leader>p',
  function ()
    vim.cmd([[ exec "NvimTreeFindFileToggle" ]])
  end, { desc = 'Open file tree on current file' })
