-- Lean floating terminal — built-in, no plugin. Replicates the old <leader>tt UX.
-- The terminal buffer persists across toggles (hidden, not killed).
local state = { buf = -1, win = -1 }

local function open()
  local width = math.floor(vim.o.columns * 0.85)
  local height = math.floor(vim.o.lines * 0.85)

  if not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = vim.api.nvim_create_buf(false, true)
  end

  state.win = vim.api.nvim_open_win(state.buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
    title = " terminal ",
    title_pos = "center",
  })

  -- Turn the scratch buffer into a terminal only once; reuse it afterward.
  if vim.bo[state.buf].buftype ~= "terminal" then
    vim.fn.jobstart(vim.o.shell, { term = true })
  end
  vim.cmd("startinsert")
end

local function toggle()
  if vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_hide(state.win)
    state.win = -1
  else
    open()
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle, { desc = "Toggle floating terminal" })

local map = vim.keymap.set
map({ "n", "t" }, "<leader>tt", toggle, { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<C-\\>", toggle, { desc = "Toggle floating terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
