return -- lazy.nvim
{
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    presets = {
      command_palette = true, -- position the cmdline and popupmenu together
    }, -- add any options here
  },
}
