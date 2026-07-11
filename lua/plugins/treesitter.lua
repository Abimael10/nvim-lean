-- Syntax, indentation, textobjects, and sticky context for big files.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- stable classic API
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "c", "comment", "css", "diff", "dockerfile", "git_config",
          "gitcommit", "gitignore", "go", "gomod", "gosum", "gowork", "html",
          "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "make",
          "markdown", "markdown_inline", "python", "query", "regex", "rust",
          "scss", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
        },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max = 200 * 1024 -- skip highlight on files > 200 KB
            local ok, stats = pcall((vim.uv or vim.loop).fs_stat, vim.api.nvim_buf_get_name(buf))
            return ok and stats and stats.size > max
          end,
        },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          },
        },
      })
    end,
  },
  -- Sticky header showing the enclosing function/class at the top of the window.
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3, multiline_threshold = 1 },
    keys = {
      { "<leader>ut", function() require("treesitter-context").toggle() end, desc = "Toggle context" },
    },
  },
}
