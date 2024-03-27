

vim.keymap.set('n', '<leader>st', function () vim.cmd [[:silent exec "!stt"]] end)

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>t', function () vim.cmd [[:tabnew]] end)

vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = "move line down"})
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = "move line up"})

vim.keymap.set('n', '<M-TAB>', ":normal gt<cr>", { desc = "change tab"})
vim.keymap.set('t', '<M-TAB>', "<C-\\><C-n>:normal gt<cr>", { desc = "change tab"})
vim.keymap.set('t', '<M-\'>' , "<C-\\><C-n>", { desc = "esc terminal mode"})
vim.keymap.set('t', '<M-q>'  , "<C-\\><C-n>", { desc = "esc terminal mode"})

