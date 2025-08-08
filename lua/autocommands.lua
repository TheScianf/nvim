-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autocommand to hide statusline for netrw buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    vim.opt_local.statusline = ' ' -- single space so it's invisible
  end,
})
