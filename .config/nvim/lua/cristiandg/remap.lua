
vim.api.nvim_create_user_command('ScratchBuffer', ':enew', {})
vim.api.nvim_create_user_command(
  'Format',
  function(args)
    if args.count ~= -1 then
      local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
      local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
      vim.lsp.buf.format({
        range = {
          ["start"] = { start_row, 0 },
          ["end"] = { end_row, 0 },
        },
        async = true,
      })
    else
      vim.lsp.buf.format({ async = true })
    end
  end,
  { range = true }
)

vim.keymap.set('n', '<leader>st', function () vim.cmd [[:silent exec "!stt"]] end, { desc = "[s]pawn [t]erminal" })

vim.keymap.set('n', '<leader>cc',
  function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then
        qf_exists = true
      end
    end
    vim.cmd('botright ' .. (qf_exists and 'cclose' or 'copen'))
  end,
  { desc = ":ctoggle" })

vim.keymap.set('n', '<leader>ll',
  function()
    local loclist_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then
        loclist_exists = true
      end
    end
    vim.cmd('botright ' .. (loclist_exists and 'lclose' or 'lopen'))
  end,
  { desc = ":ltoggle" })

vim.keymap.set('n', '<leader>M', ':make<cr>', { desc = ":make" })
vim.keymap.set('n', '<leader>m', ':make!<cr>', { desc = ":make no jump" })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set('n', '<leader>tn', ":tabnew<cr>")

vim.keymap.set('n', '<C-J>', ":cnext<cr>")
vim.keymap.set('n', '<C-K>', ":cprevious<cr>")

vim.keymap.set('v', 'D', '"_d', { desc = "delete to narnia"})

vim.keymap.set('v', '<M-S-j>', ":m '>+1<CR>gv=gv", { desc = "move line down"})
vim.keymap.set('v', '<M-S-k>', ":m '<-2<CR>gv=gv", { desc = "move line up"})
vim.keymap.set('n', '<M-S-j>', ":m +1<CR>==", { desc = "move line down"})
vim.keymap.set('n', '<M-S-k>', ":m -2<CR>==", { desc = "move line up"})

vim.keymap.set('n', '<M-S-l>', ":normal gt<cr>", { desc = "change tab"})
vim.keymap.set('t', '<M-S-l>', "<C-\\><C-n>:normal gt<cr>", { desc = "change tab"})
vim.keymap.set('t', '<ESC>' , "<C-\\><C-n>", { desc = "esc terminal mode"})
vim.keymap.set('t', '<M-\'>' , "<C-\\><C-n>", { desc = "esc terminal mode"})
vim.keymap.set('t', '<M-q>'  , "<C-\\><C-n>", { desc = "esc terminal mode"})
vim.keymap.set('t', '<M-h>'  , "<C-\\><C-n><C-W>h", { desc = ""})
vim.keymap.set('t', '<M-j>'  , "<C-\\><C-n><C-W>j", { desc = ""})
vim.keymap.set('t', '<M-k>'  , "<C-\\><C-n><C-W>k", { desc = ""})
vim.keymap.set('t', '<M-l>'  , "<C-\\><C-n><C-W>l", { desc = ""})
vim.keymap.set('n', '<M-h>'  , "<C-W>h",      { desc = ""})
vim.keymap.set('n', '<M-j>'  , "<C-W>j",      { desc = ""})
vim.keymap.set('n', '<M-k>'  , "<C-W>k",      { desc = ""})
vim.keymap.set('n', '<M-l>'  , "<C-W>l",      { desc = ""})

vim.keymap.set('n', '<C-Space>', ":e #<cr>", { desc = "edit alt file"})

-- TODO: WIP
-- se estou em um buffer de terminal, trocar para o último arquivo aberto, senão trocar para o terminal
vim.keymap.set('n', '<M-\'>', function ()
  -- if vim.bo.filetype ~= "terminal" then
  --   for buf_nr, buf in ipairs(vim.api.nvim_list_bufs()) do
  --     vim.notify(vim.api.nvim_buf_get_name(buf))
  --     -- vim.print('sla', buf_nr, buf)
  --   end
  -- else
  -- end

end, { desc = "switch to term" } )
