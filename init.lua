-- nvim-lean: a from-scratch, productivity-focused config.
-- Launch with: NVIM_APPNAME=nvim-lean nvim

-- Leaders must be set before lazy.nvim loads so mappings resolve correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- Apply theme after plugins are available (matrix is a colors/ file, no plugin).
vim.schedule(function()
  pcall(vim.cmd.colorscheme, "matrix")
end)
