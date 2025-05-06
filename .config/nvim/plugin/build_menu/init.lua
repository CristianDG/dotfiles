
local build_command_history = {}

local set_build_command = function(cmd)
  vim.o.makeprg = cmd
end

vim.api.nvim_create_user_command(
  'BuildMenuPrint',
  function()
    print(vim.o.makeprg)
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

