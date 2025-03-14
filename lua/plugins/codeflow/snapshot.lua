return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  main = 'nvim-silicon',

  keys = {
    {
      mode = 'v',
      '<leader>cs',
      '<cmd>Silicon<cr>',
      desc = 'Save a snapshot of selected code',
    },
  },
  opts = {
    -- Configuration here, or leave empty to use defaults
    line_offset = function(args)
      return args.line1
    end,
    output = function()
      return '~/Pictures/Screenshots/' .. os.date '!%Y-%m-%dT%H-%M-%SZ' .. '_code.png'
    end,
  },
}
