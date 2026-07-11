-- Format-on-save (conform) + targeted linting (nvim-lint).
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    keys = {
      { "<leader>cF", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
        rust = { "rustfmt" },
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        sh = { "shfmt" },
      },
      format_on_save = function(bufnr)
        -- Respect a per-buffer/global opt-out: :lua vim.g.disable_autoformat = true
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 3000, lsp_format = "fallback" }
      end,
    },
    init = function()
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        local global = args.bang == false
        if global then
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        else
          vim.b.disable_autoformat = not vim.b.disable_autoformat
        end
      end, { bang = true, desc = "Toggle format-on-save" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }
      local grp = vim.api.nvim_create_augroup("lean_lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = grp,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
