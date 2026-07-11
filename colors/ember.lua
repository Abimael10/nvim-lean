-- ember: warm orange/amber embers on near-black. Narrow-hue, high-focus.
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "ember"

local p = {
  -- backgrounds (warm near-black)
  bg = "#14100d", -- editor
  bg_dark = "#0e0b09", -- floats, sidebars
  bg_nc = "#100d0a", -- inactive windows
  bg_alt = "#1e1813", -- cursorline, panels, folds
  bg_sel = "#3a2314", -- visual selection (dark ember-brown)
  bg_search = "#f5a623", -- search match background (amber)

  -- foregrounds
  fg = "#e8d9c2", -- body text: warm cream
  fg_dim = "#8a7862", -- line numbers, non-text
  comment = "#75634d", -- dim warm brown, de-emphasized

  -- semantic accents
  keyword = "#f2592a", -- orange-red (primary accent: fn/if/else/as/pub)
  func = "#f3e6cd", -- bright cream (function names)
  type = "#f5a623", -- amber (types, secondary accent)
  field = "#d8c09c", -- soft tan (members / properties)
  param = "#d2bd9a", -- warm sand (parameters)
  string = "#cf914a", -- terracotta
  number = "#e6bd78", -- soft gold (numbers / constants)
  operator = "#c2ad90", -- light, recedes

  -- extra accents
  green = "#5fd38a", -- success (the ✓): git add, DiagnosticOk
  teal = "#52b3a2", -- rare cool accent (tested-values dots)

  -- diagnostics
  error = "#ff5038", -- bright red-orange
  warn = "#f5a623", -- amber
  info = "#d8a24e", -- gold
  hint = "#9a8666", -- muted warm
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
  IncSearch = { fg = p.bg, bg = "#ff6b35", bold = true },
  CurSearch = { fg = p.bg, bg = "#ff6b35", bold = true },
  Substitute = { fg = p.bg, bg = p.warn, bold = true },
  MatchParen = { fg = p.keyword, bold = true, underline = true },
  NonText = { fg = p.fg_dim },
  Whitespace = { fg = "#2a2119" },
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
  Special = { fg = p.type },
  SpecialChar = { fg = p.number },
  Tag = { fg = p.keyword },
  Delimiter = { fg = p.operator },
  SpecialComment = { fg = p.comment, bold = true },
  Debug = { fg = p.error },
  Underlined = { fg = p.type, underline = true },
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
  ["@tag.attribute"] = { fg = p.type },
  ["@tag.delimiter"] = { fg = p.fg_dim },
  ["@label"] = { fg = p.keyword },

  -- Treesitter markup (markdown, help, etc.)
  ["@markup.heading"] = { fg = p.type, bold = true },
  ["@markup.raw"] = { fg = p.string },
  ["@markup.link"] = { fg = p.keyword, underline = true },
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
  DiagnosticOk = { fg = p.green },
  DiagnosticUnderlineError = { undercurl = true, sp = p.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = p.warn },
  DiagnosticUnderlineInfo = { undercurl = true, sp = p.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = p.hint },
  DiagnosticVirtualTextError = { fg = p.error, bg = "#221512" },
  DiagnosticVirtualTextWarn = { fg = p.warn, bg = "#221c10" },
  DiagnosticVirtualTextInfo = { fg = p.info, bg = p.bg_alt },
  DiagnosticVirtualTextHint = { fg = p.hint, bg = p.bg_alt },

  -- LSP references / inlay hints
  LspReferenceText = { bg = p.bg_sel },
  LspReferenceRead = { bg = p.bg_sel },
  LspReferenceWrite = { bg = p.bg_sel, underline = true },
  LspInlayHint = { fg = p.fg_dim, bg = p.bg_alt, italic = true },

  -- Diff / Git
  DiffAdd = { fg = p.green, bg = "#16261a" },
  DiffChange = { bg = "#211a10" },
  DiffDelete = { fg = p.error, bg = "#261513" },
  DiffText = { fg = p.keyword, bg = "#3a2814" },
  diffAdded = { fg = p.green },
  diffRemoved = { fg = p.error },
  diffChanged = { fg = p.warn },
  Added = { fg = p.green },
  Removed = { fg = p.error },
  Changed = { fg = p.warn },
  GitSignsAdd = { fg = p.green },
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
  TelescopeMatching = { fg = p.type, bold = true },

  -- Snacks picker
  SnacksPickerMatch = { fg = p.type, bold = true },
  SnacksPickerDir = { fg = p.fg_dim },
  SnacksPickerBorder = { fg = p.comment, bg = p.bg_dark },
  SnacksNormal = { fg = p.fg, bg = p.bg_dark },

  -- which-key
  WhichKey = { fg = p.keyword },
  WhichKeyGroup = { fg = p.type },
  WhichKeyDesc = { fg = p.fg },
  WhichKeySeparator = { fg = p.comment },
  WhichKeyFloat = { bg = p.bg_dark },
  WhichKeyBorder = { fg = p.comment, bg = p.bg_dark },

  -- Indent guides (scope brighter to trace nesting)
  IblIndent = { fg = "#251e17" },
  IblScope = { fg = "#8a6a3e" },
  SnacksIndent = { fg = "#251e17" },
  SnacksIndentScope = { fg = "#8a6a3e" },

  -- oil.nvim
  OilDir = { fg = p.type },
  OilCopy = { fg = p.green },
  OilMove = { fg = p.warn },
  OilCreate = { fg = p.green },
  OilDelete = { fg = p.error },

  -- nvim-dap / dap-ui
  DapBreakpoint = { fg = p.error },
  DapBreakpointCondition = { fg = p.warn },
  DapLogPoint = { fg = p.info },
  DapStopped = { fg = p.green },
  DapStoppedLine = { bg = p.bg_sel },
  DapUIScope = { fg = p.type },
  DapUIType = { fg = p.type },
  DapUIValue = { fg = p.fg },
  DapUIVariable = { fg = p.fg },
  DapUIModifiedValue = { fg = p.keyword, bold = true },
  DapUIDecoration = { fg = p.comment },
  DapUIThread = { fg = p.green },
  DapUIStoppedThread = { fg = p.green },
  DapUISource = { fg = p.type },
  DapUILineNumber = { fg = p.fg_dim },
  DapUIBreakpointsPath = { fg = p.type },
  DapUIBreakpointsInfo = { fg = p.green },
  DapUIBreakpointsCurrentLine = { fg = p.keyword, bold = true },
  DapUIFloatBorder = { fg = p.comment, bg = p.bg_dark },
  DapUIWatchesValue = { fg = p.green },
  DapUIWatchesError = { fg = p.error },
}

for group, opts in pairs(groups) do
  hl(group, opts)
end

-- Terminal palette (warm/orange biased)
vim.g.terminal_color_0 = p.bg
vim.g.terminal_color_1 = p.error
vim.g.terminal_color_2 = p.green
vim.g.terminal_color_3 = p.type
vim.g.terminal_color_4 = p.teal
vim.g.terminal_color_5 = p.keyword
vim.g.terminal_color_6 = p.string
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.fg_dim
vim.g.terminal_color_9 = "#ff6b4a"
vim.g.terminal_color_10 = "#7fe0a0"
vim.g.terminal_color_11 = "#ffbf5a"
vim.g.terminal_color_12 = "#6fc9ba"
vim.g.terminal_color_13 = "#ff7a45"
vim.g.terminal_color_14 = "#e0b878"
vim.g.terminal_color_15 = "#f3e6cd"
