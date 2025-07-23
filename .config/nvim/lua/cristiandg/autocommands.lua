vim.api.nvim_create_autocmd('BufEnter', {
 pattern = 'term://*',
 command = ':startinsert'
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.go',
  callback = function () vim.o.tabstop = 2 end
})

