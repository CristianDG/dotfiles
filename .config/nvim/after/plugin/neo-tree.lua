local ok, _ = pcall(function ()
  require("neo-tree")
end)

if not ok then
  return
end

require("neo-tree").setup({

  filesystem = {

    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false, -- only works on Windows for hidden files/directories
    },

    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree

    window = {
      position = "right",
      width = 40,
    },
  },

  indent = {
    indent_size = 2,
    padding = 1, -- extra padding on left hand side
    -- indent guides
    with_markers = true,
    indent_marker = "│",
    last_indent_marker = "└",
    highlight = "NeoTreeIndentMarker",
    -- expander config, needed for nesting files
    with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
    expander_collapsed = "",
    expander_expanded = "",
    expander_highlight = "NeoTreeExpander",
  },
})

vim.keymap.set( 'n', '<leader>p',
  function ()
    vim.cmd([[ Neotree position=right source=filesystem toggle ]])
  end,
  { desc = 'Open file tree on current file' }
)

