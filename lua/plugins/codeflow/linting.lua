return {
  'mfussenegger/nvim-lint',
  opts = { linters_by_ft = { lua = { 'luacheck' }, python = { 'ruff' }, java = { 'checkstyle' }, c = { 'cpplint' } } },
  config = function()
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
