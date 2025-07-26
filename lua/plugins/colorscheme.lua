return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  opts = {
    contrast = 'soft',
    transparent_mode = true
  },
  config = function()
    vim.cmd.colorscheme 'gruvbox'
    vim.keymap.set('n', '<leader>bg', function()
      vim.o.background = vim.o.background == "dark" and "light" or "dark"
    end, { desc = 'Toggle Gruvbox theme' })
  end,
}
