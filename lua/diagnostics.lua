-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = ''
    },
  },
  underline = false,
  virtual_lines = {
    current_line = true,
    format = function(diagnostic)
      return diagnostic.message
    end,
  }
})
