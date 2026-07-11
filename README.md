# nvim-lean

A minimal Neovim setup.

## Launch

This is an isolated config via `NVIM_APPNAME`.

```sh
NVIM_APPNAME=nvim-lean nvim
# convenience alias (add to ~/.bashrc):
alias lvim='NVIM_APPNAME=nvim-lean nvim'
```

First launch clones plugins and installs Treesitter parsers. Run `:Mason` to watch
LSP servers/formatters install. Data lives under `~/.local/share/nvim-lean`,
`~/.local/state/nvim-lean`, `~/.cache/nvim-lean` — delete those to fully reset.

## Languages

Rust · Go · Python (+ Odoo) · TypeScript/JS + web (HTML/CSS/Tailwind/Emmet) · Lua · Bash.
Servers/formatters auto-install via Mason. Odoo LS auto-wires if
`~/.local/share/nvim/odoo/odoo_ls_server` exists.

## Layout

```
init.lua                  leaders, load config, apply theme
lua/config/options.lua    editor options
lua/config/keymaps.lua    core keymaps
lua/config/autocmds.lua   essential autocmds
lua/config/lazy.lua       bootstrap + plugin import
lua/plugins/*.lua         one file per concern
colors/matrix.lua         default theme (no plugin)
```

## Keymap cheatsheet (leader = `<Space>`)

**Find (Telescope)** — `<leader>ff` files · `fg` live grep · `fw` grep word · `fb` buffers
· `fr` recent · `fs`/`fS` doc/workspace symbols · `fD` diagnostics · `f<space>` resume · `en` edit config

**Navigate** — `s`/`S` flash jump/treesitter · `gd` definition · `gr` references · `K` hover
· `]f`/`[f` next/prev function · `]d`/`[d` diagnostics

**Harpoon** — `<leader>ha` pin · `<leader>hh` menu · `<leader>1-4` jump to pinned file

**Edit** — `gsa`/`gsd`/`gsr` surround add/delete/replace · `gc`/`gcc` comment (built-in)
· `af`/`if` function textobj · `aa`/`ia` argument textobj

**Code** — `<leader>cr` rename · `<leader>ca` code action · `<leader>cf` format · `<leader>uh` inlay hints

**Git** — `]h`/`[h` hunk · `<leader>gs`/`gr` stage/reset hunk · `<leader>gb` blame
· `<leader>gd` diffview · `<leader>gh` file history

**Diagnostics/lists** — `<leader>xx` all · `<leader>xX` buffer · `<leader>xs` symbols outline
· `<leader>q` toggle quickfix · `<leader>xt` TODOs

**Files** — `-` or `<leader>e` open oil (edit dir as buffer)

**Toggles** — `<leader>ut` treesitter context · `<leader>uh` inlay hints · `:FormatToggle[!]`

**Terminal** — `<leader>tt` or `<C-\>` toggle floating terminal · `<Esc><Esc>` exit terminal mode.
Built-in (no plugin); the shell session persists across toggles.

**Themes** — `<leader>uc` pick a colorscheme with live preview. Bundled: `ember` (warm
orange/amber), `matrix` (green), plus `tokyonight*` variants. Your choice persists across
restarts. First run defaults to `ember`.

## Adding things later

- **Debugging (DAP)**: intentionally not included. If added later, do it in its own
  `lua/plugins/dap.lua`. Odoo/Python debugging works best by attaching to a running
  server started under `debugpy --listen`, not by launching model files directly.
- **Richer Rust**: swap `rust_analyzer` config for `mrcjkb/rustaceanvim` + `saecki/crates.nvim`.
- **More themes**: install any theme plugin, add it to the tokyonight-style load hint in
  `lua/config/colorscheme.lua`, then pick it via `<leader>uc`. New `colors/*.lua` files
  (like `ember`/`matrix`) show up automatically.
- **A sidebar tree** (if oil isn't enough): `nvim-neo-tree/neo-tree.nvim`.
