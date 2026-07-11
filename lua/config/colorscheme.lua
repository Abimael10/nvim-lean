-- Colorscheme selection with live preview + persistence across restarts.
-- Available: ember, matrix (colors/ files) and tokyonight* (plugin).
local M = {}

M.default = "ember"
local file = vim.fn.stdpath("data") .. "/lean-colorscheme"

-- Read the last-used colorscheme, falling back to the default.
function M.read()
  local f = io.open(file, "r")
  if not f then
    return M.default
  end
  local name = f:read("l")
  f:close()
  return (name and name ~= "") and name or M.default
end

local function write(name)
  local f = io.open(file, "w")
  if not f then
    return
  end
  f:write(name)
  f:close()
end

function M.setup()
  -- Remember whichever colorscheme is active (picker, :colorscheme, anything).
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("lean_colorscheme_persist", { clear = true }),
    callback = function(ev)
      if ev.match and ev.match ~= "" then
        write(ev.match)
      end
    end,
  })

  -- <leader>uc: pick a theme with live preview (Enter applies + persists).
  vim.keymap.set("n", "<leader>uc", function()
    -- Ensure plugin themes are on the runtimepath so they show in the list.
    pcall(function()
      require("lazy").load({ plugins = { "tokyonight.nvim" } })
    end)
    require("telescope.builtin").colorscheme({ enable_preview = true })
  end, { desc = "Select colorscheme" })
end

-- Apply the saved theme (call after plugins are available). If it lives in a
-- not-yet-loaded plugin, load plugin themes and retry; fall back to the default.
function M.apply()
  local name = M.read()
  if pcall(vim.cmd.colorscheme, name) then
    return
  end
  pcall(function()
    require("lazy").load({ plugins = { "tokyonight.nvim" } })
  end)
  if not pcall(vim.cmd.colorscheme, name) then
    pcall(vim.cmd.colorscheme, M.default)
  end
end

return M
