return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require('mini.files').setup()
    vim.keymap.set('n', '\\', ':lua MiniFiles.open()<CR>', { desc = 'Open FileTree', noremap = true, silent = true })
  end,
}
