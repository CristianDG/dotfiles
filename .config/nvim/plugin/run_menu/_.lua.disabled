local M = {
  current_process = nil,  -- reference to the selected command
  running_processes = {}, -- list of all running processes
  command_history = {},   -- list of previous commands
}

-- Process structure:
-- process: lubuv struct
-- command: string for executing command
-- stdout: stdout pipe for libuv
-- stderr: stderr pipe for libuv
-- buffer: buffer when stdin and stdout will be wrote

-- TODO: check if this kills or only tries to kill
function M.kill_all()
  local i = 1
  local tries = #M.running_processes

  while i < tries do
    if #M.running_processes == 0 then
      break
    end

    local process = M.running_processes[1].process
    if process:is_active() then
      process:kill('sigterm')
    end
    table.remove(M.running_processes, 1)

    i = i + 1
  end
end

function M.purge_processes()
  local i = 1
  while i <= #M.running_processes do
    local process = M.running_processes[i]
    if process and not process.process:is_active() then
      table.remove(M.running_processes, i)
    else
      i = i + 1
    end
  end
end

function consume_until(str, fn)
  local i
  for idx = 1, #str do
    if fn(str:sub(idx, idx)) then
      i = idx
      break
    end
  end


  local first, rest
  if i then
    first = str:sub(1, i - 1)
    rest = str:sub(i)
  else
    first = str
    rest = ""
  end
  return first, rest
end


function consume_whitespace(str)
  return consume_until(str, function(chr)
    return chr ~= " "
  end)
end
function consume_non_whitespace(str)
  return consume_until(str, function(chr) return chr == " " end)
end

function process_command(command)
  local cmd = ""
  local rest_to_process = command

  cmd, rest_to_process = consume_non_whitespace(rest_to_process)
  _, rest_to_process = consume_whitespace(rest_to_process)

  rest = {}
  while #rest_to_process > 0 do
    local arg
    local quote = rest_to_process:sub(1, 1)
    if quote == "'" or quote == '"' then
      arg, rest_to_process = consume_until(rest_to_process:sub(2), function(chr) return chr == quote end)
      arg = quote .. arg .. quote
      rest_to_process = rest_to_process:sub(2)
    else
      arg, rest_to_process = consume_non_whitespace(rest_to_process)
    end
    _, rest_to_process = consume_whitespace(rest_to_process)
    table.insert(rest, arg)
  end

  return cmd, rest
end

function M.run_command(command)

  M.purge_processes()

  local stdout = vim.uv.new_pipe()
  local stderr = vim.uv.new_pipe()

  local process = {
    process = nil,
    command = command,
    stdout = stdout,
    stderr = stderr,
    buffer = {},
  }

  vim.fn.setqflist({}, 'f')
  vim.fn.setqflist({{
    text = "Executing command: " .. command,
  }}, 'a')
  table.insert(process.buffer, "Executing command: " .. command .. "\n")

  cmd, rest = process_command(command)
  if #rest == 0 then rest = nil end


  process.process = vim.uv.spawn(cmd, {
    args = rest,
    verbatim = true,
    cwd = vim.fn.getcwd(),
    stdio = { nil, stdout, stderr },
  }, function(code, signal)
    process.stderr:close()
    process.stdout:close()

    -- TODO: config when to open (on error, instantly, never)
    -- TODO: config where to open (right, below, above)
    if process.process == M.current_process.process then
      vim.schedule(function()
        vim.cmd('botright ' .. 'copen')
      end)
    end
  end)

  local fn = function(err, data)
    if data then
      table.insert(process.buffer, data)
      if M.current_process and process.process == M.current_process.process then
        vim.schedule(function()
          vim.fn.setqflist({}, 'a', { lines = vim.split(data:sub(0,-2), "\n") } )
        end)
      end
    end
  end

  vim.uv.read_start(process.stdout, fn)
  vim.uv.read_start(process.stderr, fn)

  if process then
    M.current_process = process
    table.insert(M.running_processes, 1, process)
  end
end

function create_telescope_selector(entries, entry_maker, on_choice, title)

  local list_entries = entries

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function attach_mappings(prompt_buffer_number, map)
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
    prompt_title = title,
    finder = finders.new_table({
      results = list_entries,
      entry_maker = entry_maker,
    }),
    entry_maker = entry_maker,
    sorter = conf.generic_sorter(),
    attach_mappings = attach_mappings,
  }):find()

end

function M.select_run_history_command()
  local function on_choice(choice)
    if choice and choice then
      M.run_command(choice)
    end
  end

  local function entry_maker(entry)
    return {
      value = entry,
      display = entry,
      ordinal = entry,
      on_choice = on_choice,
    }
  end
  create_telescope_selector(M.command_history, entry_maker, on_choice, "Command History")
end

function M.select_command_to_kill()
  -- IMPORTANT: entender se preciso ou não fazer isso
  -- M.purge_processes()

  local function on_choice(choice)
    if choice and choice then
      choice.process:kill('sigterm')
    end
  end

  local function entry_maker(entry)
    if entry.process:is_active() then
      return {
        value = entry,
        display = entry.command,
        ordinal = entry.command,
        on_choice = on_choice,
      }
    end
  end

  create_telescope_selector(M.running_processes, entry_maker, on_choice, "Kill Process")
end

function M.select_command()
  local function on_choice(choice)
    if choice and choice then
      M.current_process = choice
      vim.fn.setqflist({}, 'f')

      for k, data in pairs(M.current_process.buffer) do
        -- SPEED: fazer as linhas todas de uma vez só e chamar setqflist uma única vez
        vim.schedule(function()
          vim.fn.setqflist({}, 'a', { lines = vim.split(data:sub(0,-2), "\n") } )
        end)
      end

    end
  end

  local function entry_maker(entry)
    return {
      value = entry,
      -- TODO: mostrar algo diferenciando comandos ativos e inativos
      display = entry.command,
      ordinal = entry.command,
      on_choice = on_choice,
    }
  end

  create_telescope_selector(M.running_processes, entry_maker, on_choice, "Select Process")
end


vim.api.nvim_create_user_command('RunHistory', function() M.select_run_history_command() end, {})
vim.api.nvim_create_user_command('RunSelectKill', function() M.select_command_to_kill() end, {})
vim.api.nvim_create_user_command('RunSelect', function() M.select_command() end, {})

vim.api.nvim_create_user_command('RunKill', function()
  local process = M.current_process
  if process and process:is_active() then
    process:kill('sigterm')
  end
end, {})

vim.api.nvim_create_user_command(
  'Run',
  function(opts)
    command = vim.o.makeprg
    if #opts.fargs > 0 then
      command = table.concat(opts.fargs, " ")
    end

    -- TODO: limitar tamanho
    table.insert(M.command_history, 1, command)
    M.run_command(command)
  end,
  { nargs = "*", complete = "file" }
)

vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() M.kill_all() end, })

return M
