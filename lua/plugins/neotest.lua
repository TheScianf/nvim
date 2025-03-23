return {
  enabled = false,
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
    'rcasia/neotest-java',
  },
  opts = {

    adapters = {
      ['neotest-java'] = {},
      ['neotest-python'] = { runner = 'unittest' },
    },
  },
}
