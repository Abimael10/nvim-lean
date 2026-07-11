-- LSP: native vim.lsp (0.11+/0.12) with lspconfig providing server defaults,
-- Mason handling installs, and blink supplying completion capabilities.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Servers to install + enable (lspconfig names).
      local servers = {
        "lua_ls", "gopls", "rust_analyzer", "ts_ls", "pyright", "ruff",
        "html", "cssls", "emmet_language_server", "tailwindcss", "bashls",
      }
      -- Non-LSP tools (formatters/linters).
      local tools = {
        "stylua", "shfmt", "prettierd", "eslint_d", "goimports", "gofumpt",
      }

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = false, -- we enable manually below
      })
      require("mason-tool-installer").setup({ ensure_installed = tools })

      -- Global defaults for every server: blink completion capabilities.
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Per-server tweaks.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            diagnostics = { globals = { "vim" } },
            hint = { enable = true },
          },
        },
      })
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = { unusedparams = true, nilness = true },
            staticcheck = true,
            hints = { parameterNames = true },
          },
        },
      })
      -- Let ruff own lint/format actions; silence its hover (pyright handles types).
      vim.lsp.config("ruff", {
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      })

      vim.lsp.enable(servers)

      -- Odoo language server (only if the binary is present).
      local odoo = vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server")
      if vim.fn.executable(odoo) == 1 then
        vim.lsp.config("odoo_ls", {
          cmd = { odoo },
          filetypes = { "python", "xml" },
          root_markers = { "odools.toml", ".git" },
          settings = { Odoo = { selectedProfile = "main" } },
        })
        vim.lsp.enable("odoo_ls")
      end

      -- Diagnostics UI
      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = { spacing = 2, prefix = "●" },
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
      })

      -- Buffer-local LSP keymaps on attach.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lean_lsp_attach", { clear = true }),
        callback = function(event)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gI", vim.lsp.buf.implementation, "Implementation")
          map("gy", vim.lsp.buf.type_definition, "Type definition")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format (LSP)")

          -- Inlay hints toggle where supported.
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            map("<leader>uh", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
            end, "Toggle inlay hints")
          end
        end,
      })
    end,
  },
}
