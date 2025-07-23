-- file adapted from GoNZooo's build-command.lua
-- https://github.com/GoNZooo/dotneovim/blob/d69be153b39a0e04a1f96689352350db6dcac176/lua/build-command.lua

local M = {}

function load_configurations()

  -- Configurations are stored in `$cwd/build-commands.lua`
  --
  -- And specify
  -- {
  --   ["Name of command"] = {
  --     command = "command to run",
  --   },
  --   ["Name of command 2"] = { ... },
  -- }

  -- TODO:
  -- - [ ] add compiler field
  -- - [ ] add errorformat

  local config_path = vim.fn.getcwd() .. "/build-commands.lua"
  if vim.fn.filereadable(config_path) == 1 then
    local config = dofile(config_path)
    if type(config) == "table" then
      return config
    else
      vim.api.nvim_err_writeln("Invalid configuration format in " .. config_path)
    end
  else
    vim.api.nvim_err_writeln("Configuration file not found: " .. config_path)
  end
end

function M.select_build_command()
  local config = load_configurations()
  if not config then
    return
  end

  local commands = {}
  for name, cmd in pairs(config) do
    local current_commands = {}
    table.insert(commands, {name = name, command = cmd.command })
  end

  print(vim.inspect(commands))

  if #commands == 0 then
    vim.api.nvim_err_writeln("No build commands found in configuration.")
    return
  end

  local function on_choice(choice)
    if choice and choice then
      vim.o.makeprg = choice.command
    end
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  function entry_maker(entry)
    return {
      value = entry,
      display = entry.name,
      ordinal = entry.name,
      command = entry.command,
      on_choice = on_choice,
    }
  end

  function attach_mappings(prompt_buffer_number, map)
    actions.select_default:replace(function()
      actions.close(prompt_buffer_number)
      local selection = action_state.get_selected_entry()
      if selection then
        selection.on_choice(selection.value)
      end
    end)
    return true
  end

  pickers.new({
    prompt_title = "Select Build Command",
    finder = finders.new_table({
      results = commands,
      entry_maker = entry_maker,
    }),
    sorter = conf.generic_sorter(opts),
    entry_maker = entry_maker,
    attach_mappings = attach_mappings,
  }):find()

end

-- TODO: remover daqui
vim.api.nvim_create_user_command(
  'BuildMenuSet',
  function()
    M.select_build_command()
  end,
  {}
)

return M
