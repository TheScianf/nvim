# Repository Guidelines

## Project Structure & Module Organization
- `init.lua` — main entry; loads modules and plugins.
- `lua/` — config modules:
  - `lua/config/lazy.lua` — plugin manager (lazy.nvim) setup and specs.
  - `lua/plugins/` — plugin-specific config files (one file per plugin/topic).
  - `lua/keymaps.lua`, `lua/autocommands.lua`, `lua/diagnostics.lua`, `lua/lsp_config.lua` — core behavior.
  - `lua/snippets/` — LuaSnip snippets per language.
- `lsp/` — language-server settings (`<lang>_ls.lua`).
- `.stylua.toml` — Lua formatter config.

## Build, Test, and Development Commands
- Run Neovim with this config: `nvim` (uses this directory by default).
- Isolated dev sandbox: `NVIM_APPNAME=nvim-dev nvim` (safe to experiment).
- Headless startup check: `NVIM_APPNAME=nvim-dev nvim --headless '+qall'` (fails on errors).
- Format code: `stylua init.lua lua/ lsp/`.
- Plugin ops (inside Neovim): `:Lazy sync` (install/update), `:Lazy clean`, `:checkhealth`, `:Mason`.
- Reload current file after edits: `:luafile %`.

## Coding Style & Naming Conventions
- Lua: 2-space indentation, no tabs; prefer `local` scope.
- Module files: snake_case (e.g., `treesitter.lua`, `python_lsp.lua`).
- One plugin/topic per file under `lua/plugins/`; return a config/spec table.
- Keep keys, keymaps, and autocommands grouped and documented at the top level modules.
- Run `stylua` before committing.

## Testing Guidelines
- Validate no startup errors via headless check above.
- Use `:checkhealth` and confirm Mason/LSP tools are installed.
- Repro minimal issues with `nvim -u NONE` (baseline) vs. `NVIM_APPNAME=nvim-dev nvim` (this config).
- Snippets: open a buffer of the target filetype and expand to verify.

## Commit & Pull Request Guidelines
- Commits: short, present-tense summaries (style seen in history, e.g., “add kotlin snippet”, “telescope hidden files”).
- PRs: include a concise description, affected modules, any new keymaps, and before/after notes or screenshots (when UX-visible).
- Link related issues; note breaking changes or migration steps (e.g., plugin rename, moved files).

## Agent-Specific Notes
- Do not rename files or directories without purpose; keep plugin specs under `lua/plugins/` and LSP files under `lsp/`.
- Prefer small, focused changes; follow Stylua and existing patterns.
