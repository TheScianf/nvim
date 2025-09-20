# My Neovim Setup

Personal Neovim config.

Tested with Neovim 0.12.0-dev (September 16, 2025).

## Contents

- [Quick Start](#quick-start)
- [Requirements](#requirements)
- [Language Servers](#language-servers-on-path)
- [Project Structure](#project-structure)
- [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Troubleshooting](#troubleshooting)
- [Credits](#credits)

## Quick Start

- Use this config: `nvim` (when placed at `~/.config/nvim`).
- Safe sandbox: `NVIM_APPNAME=nvim-dev nvim`.
- First run: `:Lazy sync` → `:checkhealth` → `:Mason`.
- Headless check: `NVIM_APPNAME=nvim-dev nvim --headless '+qall'`.
- Format repo: `stylua init.lua lua/ lsp/`.

## Requirements

- Neovim 0.12+ and a Nerd Font.
- Optional CLIs: `lazygit`, `make` (for `telescope-fzf-native`), `codex`, `silicon`.
- Formatters: `stylua`, `ruff`, `google-java-format`, `clang-format`, `mdformat`, `ktlint`, `fixjson`.
- Linters: `luacheck`, `ruff`, `checkstyle`, `cpplint`, `ktlint`, `jsonlint`.

## Language Servers (on PATH)

- Lua: `lua-language-server`
- Markdown: `marksman`
- Kotlin: `kotlin-lsp`
- Python: `pyrefly`

Install via Mason when available, or with your system package manager.

## Project Structure

```text
init.lua
lsp/            # <lang>_ls.lua settings
lua/
  config/lazy.lua
  keymaps.lua, autocommands.lua, diagnostics.lua, lsp_config.lua
  plugins/      # one topic per file (incl. codeflow/ formatting|linting|snapshot)
  snippets/     # LuaSnip snippets per language
```

## Keymaps

- Leader: `<Space>`; windows: `Ctrl-h/j/k/l`; tabs: `<leader>nt` / `<leader>tc`.
- Files (netrw): `\` toggle. Clipboard: `<leader>y`/`<leader>Y`/`<leader>ya`.
- Movement: `j/k/G` recenter. Surround: `s[`, `s(`, `s"`.
- Terminal: `<leader>te` (new), `<leader>tx` (`codex`).
- Format: `<leader>f` (Conform). Diagnostics list: `<leader>q`.
- Colorscheme toggle: `<leader>bg` (expects `unokai` and `shine`).

LSP (buffer‑local, capability‑gated): `gd`, `gD`, `gr`, `gi`, `gtt`, `K`, `<leader>ca`, `<leader>rn`, `<leader>cl`, `<leader>th`, `<leader>li`, `<leader>lr`.

LuaSnip: expand `<C-k>`, jump `<C-l>/<C-j>`, next choice `<C-e>`, list `<C-s>`.

Telescope: `<leader>sf` files, `<leader>sg` grep, `<leader>sw` word, `<leader>sd` diagnostics, `<leader>sc` colorscheme, `<leader>sn` config.

Snapshots (nvim-silicon): visual `<leader>cs` → `~/Pictures/Screenshots/`.

## Plugins

- `folke/lazy.nvim`
- Built‑in LSP completion (Neovim 0.12) + `L3MON4D3/LuaSnip`
- `nvim-telescope/telescope.nvim` (+ `telescope-fzf-native`, `telescope-ui-select`)
- `nvim-treesitter/nvim-treesitter`
- `mason-org/mason.nvim`
- `stevearc/conform.nvim`, `mfussenegger/nvim-lint`
- `kdheepak/lazygit.nvim`
- `michaelrommel/nvim-silicon`
- `tpope/vim-sleuth`
- `lervag/vimtex`

## Troubleshooting

- Colorscheme error: install `unokai`/`shine` or change `vim.cmd.colorscheme` in `lua/keymaps.lua`.
- FZF native missing: ensure `make` exists.
- No LSP: confirm servers on PATH and filetype matches; check `:Mason`.
- Startup errors: run the headless check above.

## Credits

Inspired by Kickstart.nvim; adapted for my workflow.
