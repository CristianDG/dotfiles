local ft = require('Comment.ft')
local api = require('Comment.api')

ft({'ocaml'}, {'', '(*%s*)'})
ft({'go', 'rust'}, ft.get('c'))
ft({'toml', 'graphql'}, '#%s')


vim.keymap.set('n', '<C-;>', api.toggle.linewise.current)
vim.keymap.set('n', '<C-S-;>', api.toggle.blockwise.current)

vim.keymap.set('x', '<C-;>', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<C-S-;>', '<Plug>(comment_toggle_blockwise_visual)')
