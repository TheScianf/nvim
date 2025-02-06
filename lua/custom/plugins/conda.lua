return {
  'kmontocam/nvim-conda',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>ce', '<cmd>CondaActivate<CR>', { desc = 'Activate conda environment' })
    vim.keymap.set('n', '<leader>cd', '<cmd>CondaDeactivate<CR>', { desc = 'Deactivate conda environment' })
  end,
}
