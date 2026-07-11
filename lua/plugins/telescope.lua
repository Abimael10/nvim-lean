-- Telescope with native fzf sorter. The finder hub for large repos.
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      -- Files & search
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fd", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word", mode = { "n", "v" } },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>f<space>", "<cmd>Telescope resume<cr>", desc = "Resume last picker" },
      {
        "<leader>en",
        function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end,
        desc = "Edit nvim config",
      },
      -- LSP navigation at scale
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References (Telescope)" },
    },
    opts = {
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top", horizontal = { preview_width = 0.55 } },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "smart_send_to_qflist" .. "|open_qflist", -- send results to quickfix
          },
        },
        file_ignore_patterns = { "%.git/", "node_modules/", "target/", "dist/", "%.venv/" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = { additional_args = { "--hidden" } },
      },
    },
    config = function(_, opts)
      -- smart_send_to_qflist|open_qflist isn't a valid string action; wire it properly.
      local actions = require("telescope.actions")
      opts.defaults.mappings.i["<C-q>"] = function(bufnr)
        actions.smart_send_to_qflist(bufnr)
        actions.open_qflist(bufnr)
      end
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}
