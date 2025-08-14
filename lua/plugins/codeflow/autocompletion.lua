local source_priority = {
  snippets = 4,
  lsp = 3,
  path = 2,
  buffer = 1,
}
return {
  'saghen/blink.cmp',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'Nerd Font Mono',
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },
    snippets = { preset = 'luasnip' },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'snippets', 'lsp', 'path', 'buffer' },
    },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      sorts = {
        function(a, b)
          local a_priority = source_priority[a.source_id]
          local b_priority = source_priority[b.source_id]
          if a_priority ~= b_priority then
            return a_priority > b_priority
          end
        end,
        -- defaults
        'score',
        'sort_text',
      },
    },
  },
  opts_extend = { 'sources.default' },
}
