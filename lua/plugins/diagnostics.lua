-- Diagnostics/reference list (trouble), TODO navigation, editable quickfix.
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (all)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols outline" },
      { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs/defs" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
    },
    opts = { focus = true },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODOs (Trouble)" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "TODOs (Telescope)" },
    },
    opts = {},
  },
  -- Editable, better-rendered quickfix — the home for grep/reference results.
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    keys = {
      { "<leader>q", function() require("quicker").toggle() end, desc = "Toggle quickfix" },
      { "<leader>Q", function() require("quicker").toggle({ loclist = true }) end, desc = "Toggle loclist" },
    },
    opts = {
      opts = { number = true },
      editor = { autosave = true },
    },
  },
}
