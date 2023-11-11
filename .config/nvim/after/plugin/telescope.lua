
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`


require('telescope').setup {
  defaults = {
    previewer = true,
    layout_strategy = "flex",

    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- git worktrees
require("telescope").load_extension("git_worktree")

local builtin = require('telescope.builtin')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })


vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>gw', require('telescope').extensions.git_worktree.git_worktrees, { desc = 'Search [G]it [W]orktrees' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>;', builtin.live_grep, { desc = '[;] Search by [G]rep' })
vim.keymap.set('n', '<leader>.', builtin.find_files, { desc = '[.] Search files' })
vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = '[,] Search in buffers' })
