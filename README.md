# My Neovim Setup

This is my personal Neovim configuration. Feel free to copy ideas, but expect choices that reflect my habits.

Tested with Neovim 0.12.0-dev as of September 16, 2025.

## Contents

- [Quick Start](#quick-start)
- [Requirements](#requirements)
- [Plugin Manager](#plugin-manager)
- [LSP Servers Expected on PATH](#lsp-servers-expected-on-path)
- [Project Structure](#project-structure)
- [Keymaps & UX](#keymaps--ux)
- [Plugins](#plugins)
- [Development](#development)
- [Troubleshooting](#troubleshooting)
- [Credits](#credits)

## Quick Start

- Safe sandbox: `NVIM_APPNAME=nvim-dev nvim`
- First run inside Neovim: `:Lazy sync` then `:checkhealth` and `:Mason`
- Headless check (fails if there are startup errors):
  `NVIM_APPNAME=nvim-dev nvim --headless '+qall'`
- Format this repo: `stylua init.lua lua/ lsp/`

## Requirements

- Neovim 0.12+ (nightly/dev ok)
- A Nerd Font (for icons)
- Optional CLIs used by the config:
  - `lazygit` (git TUI)
  - `make` (builds Telescope fzf-native when available)
  - `codex` (used by a terminal mapping; optional)
  - `silicon` (for code snapshots via nvim-silicon; optional)
- Formatters/linters (install via your system or Mason):
  - Formatters: `stylua`, `ruff`, `google-java-format`, `clang-format`, `mdformat`, `ktlint`, `fixjson`
  - Linters: `luacheck`, `ruff`, `checkstyle`, `cpplint`, `ktlint`, `jsonlint`

## Plugin Manager

I manage plugins with [lazy.nvim](https://github.com/folke/lazy.nvim). I keep the spec split under `lua/plugins/` (one topic per file) and may experiment with the built‑in `vim.pack` in the future.

## LSP Servers Expected on PATH

This config enables LSP via `lsp/*.lua` definitions and `vim.lsp.enable` in `lua/lsp_config.lua`.

- Lua: `lua-language-server`
- Markdown: `marksman`
- Kotlin: `kotlin-lsp`
- Python: `pyrefly`

You can install servers with Mason when available, or via your package manager. Open `:Mason` to discover what Mason can manage on your machine.

## Project Structure

```text
├── init.lua
├── LICENSE.md
├── lsp
│  ├── kotlin_lsp.lua
│  ├── lua_ls.lua
│  ├── markdown_ls.lua
│  └── python_lsp.lua
├── lua
│  ├── autocommands.lua
│  ├── config
│  │  └── lazy.lua
│  ├── diagnostics.lua
│  ├── keymaps.lua
│  ├── lsp_config.lua
│  ├── plugins
│  │  ├── codeflow
│  │  │  ├── autocompletion.lua
│  │  │  ├── formatting.lua
│  │  │  ├── linting.lua
│  │  │  └── snapshot.lua
│  │  ├── lazygit.lua
│  │  ├── luasnip.lua
│  │  ├── mason.lua
│  │  ├── telescope.lua
│  │  └── treesitter.lua
│  └── snippets
│     ├── c.lua
│     ├── java.lua
│     ├── kotlin.lua
│     ├── markdown.lua
│     ├── prolog.lua
│     └── python.lua
└── README.md
```

## Keymaps & UX

- Leader: space (`<Space>`)
- Windows: `Ctrl-h/j/k/l` to move
- Tabs: `<leader>nt` new, `<leader>tc` close
- File tree (netrw): `\` to toggle
- Clipboard: visual `<leader>y`, normal `<leader>Y`, `<leader>ya` whole file
- Centering: `j/k/G` auto-center with `zz`
- Surround operator: `s[`, `s(`, `s"`
- Terminal: `<leader>te` new terminal tab, `<leader>tx` opens terminal running `codex --search`
- Format buffer: `<leader>f` (Conform)
- Diagnostics: `<leader>q` open loclist
- Colorscheme toggle: `<leader>bg` (expects `unokai` and `shine` installed)

LSP (buffer‑local; enabled per server capability):

- Go to: `gd` definition, `gD` declaration, `gr` references, `gi` implementation, `gtt` type
- Hover: `K`
- Actions: `<leader>ca` code actions, `<leader>rn` rename, `<leader>cl` run code lens, `<leader>th` toggle inlay hints
- Info: `<leader>li` list attached clients, `<leader>lr` restart clients

LuaSnip:

- Expand: `Ctrl-k`
- Jump: `Ctrl-l` forward, `Ctrl-j` backward
- Choices: `Ctrl-e` next choice
- List snippets (menu): `Ctrl-s`

Telescope (selected):

- `<leader>sf` files, `<leader>sg` live grep, `<leader>sw` word, `<leader>sd` diagnostics, `<leader>sc` colorscheme, `<leader>sn` this config

Code snapshots (nvim-silicon):

- Visual mode `<leader>cs` saves a PNG into `~/Pictures/Screenshots/`

## Plugins

- lazy.nvim (plugin manager)
- blink.cmp (completion) + LuaSnip (snippets)
- telescope.nvim (+ fzf-native, ui-select)
- nvim-treesitter
- mason.nvim
- conform.nvim (formatting) and nvim-lint (linting)
- lazygit.nvim
- nvim-silicon (code snapshots)
- vim-sleuth (indent detection)

## Development

- Format: `stylua init.lua lua/ lsp/`
- Reload the current file: `:luafile %`
- Isolated sandbox: `NVIM_APPNAME=nvim-dev nvim`
- Plugin ops: `:Lazy sync`, `:Lazy clean`, `:Mason`, `:checkhealth`

## Troubleshooting

- Colorscheme error on startup: this config sets `unokai` and toggles with `shine` in `lua/keymaps.lua`. Install those themes or change the `vim.cmd.colorscheme` line.
- Telescope fzf-native not loading: ensure `make` is available on your system.
- No LSP features: confirm servers are installed and on `PATH` (see LSP section) and that the filetype matches the server definition.
- Headless check fails: run the headless command above to see if any startup errors occur.

## Credits

Inspired by [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and refined to fit my workflow.
