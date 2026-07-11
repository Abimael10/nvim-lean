vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "matrix"

local p = {
	-- backgrounds (dark green-gray)
	bg = "#0f140f", -- editor
	bg_dark = "#0b0f0b", -- floats, sidebars
	bg_nc = "#0c110c", -- inactive windows (gentle split separation)
	bg_alt = "#171e17", -- cursorline, panels, folds
	bg_sel = "#2a3d2c", -- visual selection
	bg_search = "#b7a35e", -- search match background

	-- foregrounds
	fg = "#bdcdb4", -- body text: low-chroma green-gray (low strain)
	fg_dim = "#6f846f", -- line numbers, non-text
	comment = "#6b886f", -- dim green, readable but de-emphasized

	-- semantic accents (hue-separated, moderate chroma)
	keyword = "#83c78c", -- green (Matrix signature)
	func = "#cdbf6f", -- gold / yellow-green
	type = "#6cc2ad", -- teal-green
	field = "#a9c7b0", -- soft green (members / properties)
	param = "#c7bd9e", -- warm sand (parameters)
	string = "#cda06a", -- amber
	number = "#b79ec9", -- muted lilac (numbers / constants)
	operator = "#86a087", -- muted, recedes

	-- diagnostics (calm, not alarm)
	error = "#d18a8a", -- muted rose
	warn = "#cbb56a", -- amber-yellow
	info = "#6cc2ad", -- teal
	hint = "#86a890", -- muted green
	none = "NONE",
}

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local groups = {
	-- Editor UI
	Normal = { fg = p.fg, bg = p.bg },
	NormalNC = { fg = p.fg, bg = p.bg_nc },
	NormalFloat = { fg = p.fg, bg = p.bg_dark },
	FloatBorder = { fg = p.comment, bg = p.bg_dark },
	FloatTitle = { fg = p.keyword, bg = p.bg_dark, bold = true },
	ColorColumn = { bg = p.bg_alt },
	Cursor = { fg = p.bg, bg = p.keyword },
	lCursor = { fg = p.bg, bg = p.keyword },
	CursorLine = { bg = p.bg_alt },
	CursorColumn = { bg = p.bg_alt },
	CursorLineNr = { fg = p.keyword, bold = true },
	LineNr = { fg = p.fg_dim },
	LineNrAbove = { fg = p.fg_dim },
	LineNrBelow = { fg = p.fg_dim },
	SignColumn = { fg = p.fg_dim, bg = p.bg },
	FoldColumn = { fg = p.fg_dim, bg = p.bg },
	Folded = { fg = p.comment, bg = p.bg_alt },
	Visual = { bg = p.bg_sel },
	VisualNOS = { bg = p.bg_sel },
	Search = { fg = p.bg, bg = p.bg_search },
	IncSearch = { fg = p.bg, bg = "#9bd89b", bold = true },
	CurSearch = { fg = p.bg, bg = "#9bd89b", bold = true },
	Substitute = { fg = p.bg, bg = p.warn, bold = true },
	MatchParen = { fg = p.keyword, bold = true, underline = true },
	NonText = { fg = p.fg_dim },
	Whitespace = { fg = "#283328" },
	SpecialKey = { fg = p.fg_dim },
	EndOfBuffer = { fg = p.bg },
	Conceal = { fg = p.fg_dim },
	WinSeparator = { fg = p.comment, bg = p.bg },
	VertSplit = { fg = p.comment, bg = p.bg },
	Directory = { fg = p.type },
	Title = { fg = p.keyword, bold = true },
	Question = { fg = p.keyword },
	MoreMsg = { fg = p.keyword },
	ModeMsg = { fg = p.fg, bold = true },
	ErrorMsg = { fg = p.error, bold = true },
	WarningMsg = { fg = p.warn },
	QuickFixLine = { bg = p.bg_sel, bold = true },
	WinBar = { fg = p.fg, bg = p.bg },
	WinBarNC = { fg = p.fg_dim, bg = p.bg },

	-- Popup menu / completion
	Pmenu = { fg = p.fg, bg = p.bg_dark },
	PmenuSel = { fg = p.bg, bg = p.keyword, bold = true },
	PmenuSbar = { bg = p.bg_alt },
	PmenuThumb = { bg = p.comment },
	WildMenu = { fg = p.bg, bg = p.keyword },

	-- Statusline / tabs
	StatusLine = { fg = p.fg, bg = p.bg_alt },
	StatusLineNC = { fg = p.fg_dim, bg = p.bg_dark },
	TabLine = { fg = p.fg_dim, bg = p.bg_dark },
	TabLineSel = { fg = p.bg, bg = p.keyword, bold = true },
	TabLineFill = { bg = p.bg_dark },

	-- Legacy syntax
	Comment = { fg = p.comment, italic = true },
	Constant = { fg = p.number },
	String = { fg = p.string },
	Character = { fg = p.string },
	Number = { fg = p.number },
	Boolean = { fg = p.number },
	Float = { fg = p.number },
	Identifier = { fg = p.fg },
	Function = { fg = p.func },
	Statement = { fg = p.keyword, bold = true },
	Conditional = { fg = p.keyword, bold = true },
	Repeat = { fg = p.keyword, bold = true },
	Label = { fg = p.keyword },
	Operator = { fg = p.operator },
	Keyword = { fg = p.keyword, bold = true },
	Exception = { fg = p.keyword, bold = true },
	PreProc = { fg = p.type },
	Include = { fg = p.keyword, bold = true },
	Define = { fg = p.keyword },
	Macro = { fg = p.type },
	PreCondit = { fg = p.type },
	Type = { fg = p.type },
	StorageClass = { fg = p.type },
	Structure = { fg = p.type },
	Typedef = { fg = p.type },
	Special = { fg = p.func },
	SpecialChar = { fg = p.number },
	Tag = { fg = p.keyword },
	Delimiter = { fg = p.operator },
	SpecialComment = { fg = p.comment, bold = true },
	Debug = { fg = p.error },
	Underlined = { fg = p.func, underline = true },
	Ignore = { fg = p.fg_dim },
	Error = { fg = p.error, bold = true },
	Todo = { fg = p.bg, bg = p.warn, bold = true },

	-- Treesitter
	["@comment"] = { link = "Comment" },
	["@comment.error"] = { fg = p.error, bold = true },
	["@comment.warning"] = { fg = p.warn, bold = true },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { fg = p.type, bold = true },
	["@keyword"] = { fg = p.keyword, bold = true },
	["@keyword.function"] = { fg = p.keyword, bold = true },
	["@keyword.return"] = { fg = p.keyword, bold = true },
	["@keyword.operator"] = { fg = p.keyword },
	["@keyword.import"] = { fg = p.keyword, bold = true },
	["@keyword.exception"] = { fg = p.keyword, bold = true },
	["@conditional"] = { fg = p.keyword, bold = true },
	["@repeat"] = { fg = p.keyword, bold = true },
	["@function"] = { fg = p.func },
	["@function.call"] = { fg = p.func },
	["@function.builtin"] = { fg = p.func, italic = true },
	["@function.macro"] = { fg = p.type },
	["@method"] = { fg = p.func },
	["@method.call"] = { fg = p.func },
	["@constructor"] = { fg = p.type },
	["@variable"] = { fg = p.fg },
	["@variable.builtin"] = { fg = p.keyword, italic = true },
	["@variable.parameter"] = { fg = p.param },
	["@variable.member"] = { fg = p.field },
	["@property"] = { fg = p.field },
	["@field"] = { fg = p.field },
	["@string"] = { fg = p.string },
	["@string.escape"] = { fg = p.number, bold = true },
	["@string.special"] = { fg = p.number },
	["@string.regexp"] = { fg = p.number },
	["@character"] = { fg = p.string },
	["@number"] = { fg = p.number },
	["@boolean"] = { fg = p.number },
	["@float"] = { fg = p.number },
	["@constant"] = { fg = p.number },
	["@constant.builtin"] = { fg = p.number, bold = true },
	["@constant.macro"] = { fg = p.type },
	["@type"] = { fg = p.type },
	["@type.builtin"] = { fg = p.type, italic = true },
	["@type.definition"] = { fg = p.type },
	["@attribute"] = { fg = p.type },
	["@namespace"] = { fg = p.type },
	["@module"] = { fg = p.type },
	["@operator"] = { fg = p.operator },
	["@punctuation.delimiter"] = { fg = p.operator },
	["@punctuation.bracket"] = { fg = p.fg_dim },
	["@punctuation.special"] = { fg = p.keyword },
	["@tag"] = { fg = p.keyword },
	["@tag.attribute"] = { fg = p.func },
	["@tag.delimiter"] = { fg = p.fg_dim },
	["@label"] = { fg = p.keyword },

	-- Treesitter markup (markdown, help, etc.)
	["@markup.heading"] = { fg = p.keyword, bold = true },
	["@markup.raw"] = { fg = p.string },
	["@markup.link"] = { fg = p.func, underline = true },
	["@markup.link.url"] = { fg = p.type, underline = true },
	["@markup.list"] = { fg = p.keyword },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.quote"] = { fg = p.comment, italic = true },

	-- LSP semantic tokens (defer plain variables to treesitter)
	["@lsp.type.keyword"] = { link = "@keyword" },
	["@lsp.type.function"] = { link = "@function" },
	["@lsp.type.method"] = { link = "@method" },
	["@lsp.type.type"] = { link = "@type" },
	["@lsp.type.class"] = { link = "@type" },
	["@lsp.type.struct"] = { link = "@type" },
	["@lsp.type.interface"] = { link = "@type" },
	["@lsp.type.enum"] = { link = "@type" },
	["@lsp.type.enumMember"] = { link = "@constant" },
	["@lsp.type.namespace"] = { link = "@namespace" },
	["@lsp.type.property"] = { link = "@property" },
	["@lsp.type.parameter"] = { link = "@variable.parameter" },
	["@lsp.type.variable"] = {},

	-- Diagnostics
	DiagnosticError = { fg = p.error },
	DiagnosticWarn = { fg = p.warn },
	DiagnosticInfo = { fg = p.info },
	DiagnosticHint = { fg = p.hint },
	DiagnosticOk = { fg = p.keyword },
	DiagnosticUnderlineError = { undercurl = true, sp = p.error },
	DiagnosticUnderlineWarn = { undercurl = true, sp = p.warn },
	DiagnosticUnderlineInfo = { undercurl = true, sp = p.info },
	DiagnosticUnderlineHint = { undercurl = true, sp = p.hint },
	DiagnosticVirtualTextError = { fg = p.error, bg = "#1c1414" },
	DiagnosticVirtualTextWarn = { fg = p.warn, bg = "#1c1a12" },
	DiagnosticVirtualTextInfo = { fg = p.info, bg = p.bg_alt },
	DiagnosticVirtualTextHint = { fg = p.hint, bg = p.bg_alt },

	-- LSP references / inlay hints
	LspReferenceText = { bg = p.bg_sel },
	LspReferenceRead = { bg = p.bg_sel },
	LspReferenceWrite = { bg = p.bg_sel, underline = true },
	LspInlayHint = { fg = p.fg_dim, bg = p.bg_alt, italic = true },

	-- Diff / Git
	DiffAdd = { fg = p.keyword, bg = "#16261a" },
	DiffChange = { bg = "#141e16" },
	DiffDelete = { fg = p.error, bg = "#241616" },
	DiffText = { fg = p.keyword, bg = "#1e3a26" },
	diffAdded = { fg = p.keyword },
	diffRemoved = { fg = p.error },
	diffChanged = { fg = p.warn },
	Added = { fg = p.keyword },
	Removed = { fg = p.error },
	Changed = { fg = p.warn },
	GitSignsAdd = { fg = p.keyword },
	GitSignsChange = { fg = p.warn },
	GitSignsDelete = { fg = p.error },

	-- Spell
	SpellBad = { undercurl = true, sp = p.error },
	SpellCap = { undercurl = true, sp = p.warn },
	SpellLocal = { undercurl = true, sp = p.info },
	SpellRare = { undercurl = true, sp = p.type },

	-- Telescope
	TelescopeNormal = { fg = p.fg, bg = p.bg_dark },
	TelescopeBorder = { fg = p.comment, bg = p.bg_dark },
	TelescopePromptNormal = { fg = p.fg, bg = p.bg_alt },
	TelescopePromptBorder = { fg = p.comment, bg = p.bg_alt },
	TelescopePromptTitle = { fg = p.bg, bg = p.keyword, bold = true },
	TelescopeResultsTitle = { fg = p.bg, bg = p.keyword, bold = true },
	TelescopePreviewTitle = { fg = p.bg, bg = p.keyword, bold = true },
	TelescopePromptPrefix = { fg = p.keyword },
	TelescopeSelection = { fg = p.fg, bg = p.bg_sel },
	TelescopeMatching = { fg = p.func, bold = true },

	-- Snacks picker
	SnacksPickerMatch = { fg = p.func, bold = true },
	SnacksPickerDir = { fg = p.fg_dim },
	SnacksPickerBorder = { fg = p.comment, bg = p.bg_dark },
	SnacksNormal = { fg = p.fg, bg = p.bg_dark },

	-- which-key
	WhichKey = { fg = p.func },
	WhichKeyGroup = { fg = p.type },
	WhichKeyDesc = { fg = p.fg },
	WhichKeySeparator = { fg = p.comment },
	WhichKeyFloat = { bg = p.bg_dark },
	WhichKeyBorder = { fg = p.comment, bg = p.bg_dark },

	-- Indent guides (indent-blankline / snacks); scope is brighter to trace nesting
	IblIndent = { fg = "#1d261d" },
	IblScope = { fg = "#6f9075" },
	SnacksIndent = { fg = "#1d261d" },
	SnacksIndentScope = { fg = "#6f9075" },

	-- nvim-dap / dap-ui
	DapBreakpoint = { fg = p.error },
	DapBreakpointCondition = { fg = p.warn },
	DapLogPoint = { fg = p.info },
	DapStopped = { fg = p.keyword },
	DapStoppedLine = { bg = p.bg_sel },
	DapUIScope = { fg = p.func },
	DapUIType = { fg = p.type },
	DapUIValue = { fg = p.fg },
	DapUIVariable = { fg = p.fg },
	DapUIModifiedValue = { fg = p.keyword, bold = true },
	DapUIDecoration = { fg = p.comment },
	DapUIThread = { fg = p.keyword },
	DapUIStoppedThread = { fg = p.keyword },
	DapUISource = { fg = p.type },
	DapUILineNumber = { fg = p.fg_dim },
	DapUIBreakpointsPath = { fg = p.func },
	DapUIBreakpointsInfo = { fg = p.keyword },
	DapUIBreakpointsCurrentLine = { fg = p.keyword, bold = true },
	DapUIFloatBorder = { fg = p.comment, bg = p.bg_dark },
	DapUIWatchesValue = { fg = p.keyword },
	DapUIWatchesError = { fg = p.error },
}

for group, opts in pairs(groups) do
	hl(group, opts)
end

-- Terminal palette (muted, green/warm biased)
vim.g.terminal_color_0 = p.bg
vim.g.terminal_color_1 = p.error
vim.g.terminal_color_2 = p.keyword
vim.g.terminal_color_3 = p.warn
vim.g.terminal_color_4 = "#5aa890"
vim.g.terminal_color_5 = p.number
vim.g.terminal_color_6 = "#7fc9b4"
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.fg_dim
vim.g.terminal_color_9 = "#e0a0a0"
vim.g.terminal_color_10 = "#9bd89b"
vim.g.terminal_color_11 = "#dcc77c"
vim.g.terminal_color_12 = "#7fc9b4"
vim.g.terminal_color_13 = "#cbb4d8"
vim.g.terminal_color_14 = "#9bd8c4"
vim.g.terminal_color_15 = "#dfeccf"
