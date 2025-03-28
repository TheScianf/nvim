return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  opts = { contrast = 'soft' },
  config = function()
    vim.cmd.colorscheme 'gruvbox'
  end,
}
