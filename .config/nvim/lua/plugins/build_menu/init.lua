

local build_command = vim.o.makeprg

local set_build_command = function(cmd)
  build_command = cmd
  vim.o.makeprg = build_command
end

vim.keymap.set('n', '<leader>b', ':BuildMenuSet '.. build_command, { desc = "[B]uild command [S]et" })

vim.api.nvim_create_user_command(
  'BuildMenuPrint',
  function()
    print(build_command)
  end,
  {}
)

vim.api.nvim_create_user_command(
  'BuildMenuSet',
  function(opts)
    set_build_command(table.concat(opts.fargs, " "))
  end,
  {nargs = "+"}
)

