-- Completion: blink.cmp (Rust fuzzy matcher, LSP + snippets + path + buffer).
return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*", -- prebuilt binaries
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" }, -- C-y accept, C-space docs, C-n/C-p navigate
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = false },
      },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
}
