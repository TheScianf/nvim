return {
  'mfussenegger/nvim-lint',
  config = function()
    -- 1. Manually assign the linters here
    require('lint').linters_by_ft = {
      lua = { 'luacheck' },
      python = { 'ruff' },
      java = { 'checkstyle' },
      c = { 'cpplint' },
      kotlin = { 'ktlint' },
      json = { 'jsonlint' },
      markdown = {}, -- This will now actually work
    }

    -- 2. Create the autocommand
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
