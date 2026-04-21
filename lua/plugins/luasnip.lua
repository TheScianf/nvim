return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'
    local ls_loader = require 'luasnip.loaders.from_lua'

    ls.config.setup {
      history = true,
      delete_check_events = 'TextChanged',
      updateevents = 'TextChanged,TextChangedI',
    }

    -- Load custom snippets
    ls_loader.load {
      paths = { '~/.config/nvim/lua/snippets/' },
    }
    -- Snippet autocompletion

    vim.o.completefunc = 'v:lua.snippet_complete'

    function _G.snippet_complete(findstart, base)
      local luasnip = require 'luasnip'
      local filetype = vim.bo.filetype
      if findstart == 1 then
        local line = vim.fn.getline '.'
        local col = vim.fn.col '.' - 1
        while col > 0 and line:sub(col, col):match '%w' do
          col = col - 1
        end
        return col
      else
        local results = {}
        local snippets = luasnip.get_snippets(filetype) or {}
        for _, snip in ipairs(snippets) do
          if snip.trigger:match('^' .. vim.pesc(base)) then
            table.insert(results, {
              word = snip.trigger,
              abbr = snip.name or snip.trigger,
              menu = 'Snippet',
              info = table.concat(snip.dscr or { '' }, ' '),
            })
          end
        end
        return #results > 0 and results or nil
      end
    end

    vim.keymap.set({ 'i' }, '<C-k>', function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-e>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
    vim.keymap.set({ 'i', 'n' }, '<C-s>', '<C-x><C-u>', { silent = true, desc = 'Show available snippets' })
  end,
}
