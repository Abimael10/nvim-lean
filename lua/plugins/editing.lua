-- Core editing: surround, smart textobjects, autopairs, JSX-aware comments.
return {
  -- Surround under `gs` prefix (keeps `s` free for flash jump).
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  -- Extended a/i textobjects (function args, brackets, etc.).
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ a = { "@block.outer", "@conditional.outer", "@loop.outer" }, i = { "@block.inner", "@conditional.inner", "@loop.inner" } }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        },
      }
    end,
  },
  -- Autopairs.
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = { modes = { insert = true, command = true, terminal = false } },
  },
  -- Correct commentstring in embedded languages (JSX/TSX, Vue, etc.).
  -- Neovim's built-in gc/gcc handles the actual commenting.
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
