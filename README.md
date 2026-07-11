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

**Debug** — `<leader>db` breakpoint · `<leader>dc` continue · `<leader>di/do/dO` step
· `<leader>du` UI · `<leader>de` eval (fully lazy — loads on first use)

**Toggles** — `<leader>ut` treesitter context · `<leader>uh` inlay hints · `:FormatToggle[!]`

## Adding things later

- **JS/TS debugging**: add `mxsdev/nvim-dap-vscode-js` + `js-debug-adapter` (Mason) to `lua/plugins/dap.lua`.
- **Richer Rust**: swap `rust_analyzer` config for `mrcjkb/rustaceanvim` + `saecki/crates.nvim`.
- **Different theme**: `tokyonight` is installed; `:colorscheme tokyonight` or edit the schedule in `init.lua`.
- **A sidebar tree** (if oil isn't enough): `nvim-neo-tree/neo-tree.nvim`.
</content>
