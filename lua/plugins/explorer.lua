-- oil.nvim: edit the filesystem as a buffer. Fast for bulk create/rename/move.
return {
  {
    "stevearc/oil.nvim",
    lazy = false, -- takes over netrw at startup
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent dir (oil)" },
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open parent dir (oil)" },
    },
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name) return name == ".git" end,
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<C-h>"] = false, -- keep window nav
        ["<C-l>"] = false,
      },
    },
  },
}
