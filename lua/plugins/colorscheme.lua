-- Single theme plugin kept as a known-good fallback.
-- Default theme is `matrix` (a colors/ file, zero plugin cost) applied in init.lua.
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = { style = "night", dim_inactive = true },
  },
}
