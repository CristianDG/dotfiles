-- Process structure:
-- process: lubuv struct
-- command: string for executing command
-- stdout: stdout pipe for libuv
-- stderr: stderr pipe for libuv
-- buffer: buffer when stdin and stdout will be wrote

local M = {}

local function print_qflist(str)

  vim.schedule(function()
    vim.fn.setqflist({{
      text = str,
    }}, 'a')
  end)
  -- table.insert(process.buffer, str .. "\n")

end

function M.run_command(command)

  vim.fn.setqflist({}, 'f')
  print_qflist("Executing command: " .. command)

  local function fn(job_id, data, event)
    if data and #data > 1 then
      for _, line in ipairs(data) do
        vim.fn.setqflist({}, 'a', { lines = { line:gsub("\r", "") } } )
      end
    end
  end

  local full_cmd = {}
  for _, v in ipairs(vim.fn.split(vim.o.shell)) do
    table.insert(full_cmd, v)
  end
  for _, v in ipairs(vim.fn.split(vim.o.shellcmdflag)) do
    table.insert(full_cmd, v)
  end
  table.insert(full_cmd, command)

  vim.fn.jobstart(full_cmd, {
    on_stdout = fn,
    on_stderr = fn,
    on_exit = function(job_id, code, event)
      print_qflist("Process exited with code " .. code)
    end,
  })

end

vim.api.nvim_create_user_command(
  'Run',
  function(opts)
    command = vim.o.makeprg
    if #opts.fargs > 0 then
      command = table.concat(opts.fargs, " ")
    end

    M.run_command(command)
  end,
  { nargs = "*", complete = "file" }
)

return M

