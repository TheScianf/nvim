return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  main = 'nvim-silicon',

  keys = {
    {
      mode = 'v',
      '<leader>cs',
      function()
        require('nvim-silicon').file()
      end,
      desc = 'Save a snapshot of selected code',
    },
  },

  opts = {

    language = function()
      return vim.bo.filetype
    end,

    no_window_controls = true,

    window_title = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
    end,

    line_offset = 1,

    output = function()
      return '~/Pictures/Screenshots/' .. os.date '!%Y-%m-%dT%H-%M-%SZ' .. '_code.png'
    end,

    theme = 'GitHub',
    background = '#d3d3d3',
  },
}
