local ft = require('Comment.ft')
local api = require('Comment.api')

ft({'ocaml'}, {'', '(*%s*)'})
ft({'go', 'rust'}, ft.get('c'))
ft({'toml', 'graphql'}, '#%s')

-- NOTE: isso ta bugado :+1:, só o l funciona
local comment_char = ';'
if vim.fn.has('windows') then
  comment_char = 'l'
end


vim.keymap.set('n', '<C-'.. comment_char ..'>', api.toggle.linewise.current)
vim.keymap.set('n', '<C-S-'.. comment_char ..'>', api.toggle.blockwise.current)

vim.keymap.set('x', '<C-'.. comment_char ..'>', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<C-S-'.. comment_char ..'>', '<Plug>(comment_toggle_blockwise_visual)')
