return {
  { 'tpope/vim-sleuth' },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        java = { 'google-java-format' },
        c = { 'clang-format' },
        markdown = { 'mdformat' },
        kotlin = { 'ktlint' },
        json = { 'fixjson' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
  },
}
