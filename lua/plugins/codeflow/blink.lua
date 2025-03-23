return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    completion = {
      menu = { draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'kind' },
        },
      } },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    cmdline = { completion = { ghost_text = { enabled = false } } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { 'sources.default' },
}
