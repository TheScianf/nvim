# My Neovim Setup

I'm using the 0.12.0-dev version

## Content

- [Structure](#structure)
- [Plugin Manager](#plugin-manager)
- [Installed Plugins](#installed-plugins)
- [Credits](#credits)

### Structure

```bash
├── init.lua
├── lazy-lock.json
├── LICENSE.md
├── lsp
│   ├── kotlin_lsp.lua
│   ├── lua_ls.lua
│   ├── markdown_ls.lua
│   └── python_lsp.lua
├── lua
│   ├── autocommands.lua
│   ├── config
│   │   └── lazy.lua
│   ├── diagnostics.lua
│   ├── keymaps.lua
│   ├── lsp_config.lua
│   ├── plugins
│   │   ├── codeflow
│   │   │   ├── formatting.lua
│   │   │   ├── linting.lua
│   │   │   └── snapshot.lua
│   │   ├── lazygit.lua
│   │   ├── luasnip.lua
│   │   ├── mason.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   └── snippets
│       ├── c.lua
│       ├── java.lua
│       ├── kotlin.lua
│       ├── markdown.lua
│       └── python.lua
└── README.md

```

### Plugin Manager

I don't use many plugins but I manage all of them with Lazy, in the future I will use the builtin vim.pack module.

- [Lazy Plugin manager](https://github.com/folke/lazy.nvim)

### Installed Plugins

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [LazyGit](https://github.com/jesseduffield/lazygit)
- [Mason](https://github.com/mason-org/mason.nvim)
- [Conform](https://github.com/stevearc/conform.nvim)
- [Nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvim-silicon](https://github.com/michaelrommel/nvim-silicon)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip/tree/master)

### Credits

Check out [Kickstart](https://github.com/nvim-lua/kickstart.nvim), it has given me a great starting point in the Neovim World!
