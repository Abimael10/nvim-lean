-- nvim-lean: a from-scratch, productivity-focused config.
-- Launch with: NVIM_APPNAME=nvim-lean nvim

-- Leaders must be set before lazy.nvim loads so mappings resolve correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.terminal")
require("config.lazy")

-- Theme switcher (<leader>uc, live preview) + persistence. Applies the last-used
-- colorscheme; first run defaults to `ember`. Alternatives: matrix, tokyonight*.
local colorscheme = require("config.colorscheme")
colorscheme.setup()
vim.schedule(colorscheme.apply)
