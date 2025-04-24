local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local col = (vim.o.columns - width) / 2
  local row = (vim.o.lines - height) / 2

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded'
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return {
    buf = buf,
    win = win
  }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      vim.cmd.startinsert()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

local function detach()
  state.floating.buf = -1
end

local function attach()
  if vim.bo.buftype == "terminal" then
    state.floating.buf = vim.api.nvim_get_current_buf()
  end
end


vim.api.nvim_create_user_command("FTerm", toggle_terminal, {})
vim.api.nvim_create_user_command("FTAttach", attach, {})
vim.api.nvim_create_user_command("FTDetach", detach, {})
vim.keymap.set("n", "<leader>tt", toggle_terminal, { desc = "[t]oggle [t]erminal"})

