-- Editor options. Lean subset tuned for code on large repos.
local opt = vim.opt

-- Files & undo
opt.autowrite = true
opt.undofile = true
opt.undolevels = 10000
opt.confirm = true -- ask to save instead of failing on :q
opt.updatetime = 200
opt.timeoutlen = 300 -- quick which-key trigger
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- UI
opt.number = true
opt.relativenumber = false -- absolute line numbers
opt.cursorline = true
opt.signcolumn = "yes" -- no text shift when signs appear
opt.termguicolors = true
opt.laststatus = 3 -- single global statusline
opt.showmode = false -- lualine shows the mode
opt.pumheight = 10
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.wrap = false -- keep code on one line; prose wraps via autocmd
opt.linebreak = true
opt.list = true
opt.mouse = "a"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit" -- live :substitute preview
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Indent (2-space default; language plugins can override)
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true
opt.smartindent = true

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Folds via treesitter (kept open by default)
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""

-- Completion / diagnostics
opt.completeopt = "menu,menuone,noselect"
opt.virtualedit = "block"

-- Sessions (used by any restore workflow)
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "folds" }

vim.g.markdown_recommended_style = 0
