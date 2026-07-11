-- Minimal UI: statusline + keymap discovery. No animations, tabs, or message UI.
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-mini/mini.icons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        section_separators = "",
        component_separators = "|",
        disabled_filetypes = { statusline = { "oil", "trouble" } },
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- relative path
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "code" },
        { "<leader>x", group = "diagnostics/lists" },
        { "<leader>h", group = "harpoon" },
        { "<leader>u", group = "toggle/ui" },
        { "<leader>t", group = "terminal" },
        { "<leader>b", group = "buffer" },
        { "<leader>e", group = "explorer" },
      },
    },
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer keymaps" },
    },
  },
}
