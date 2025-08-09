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
    -- Function to show available snippets
    local function show_snippets()
      local filetype = vim.bo.filetype
      local snippets = ls.get_snippets(filetype)

      if #snippets == 0 then
        print('No snippets available for filetype: ' .. filetype)
        return
      end

      -- Create a table of snippet choices
      local choices = {}
      for _, snippet in ipairs(snippets) do
        local description = snippet.dscr and table.concat(snippet.dscr, ' ') or 'No description'
        table.insert(choices, {
          name = snippet.name,
          trigger = snippet.trigger,
          description = description,
          snippet = snippet,
        })
      end

      -- Show the selection menu
      vim.ui.select(choices, {
        prompt = 'Select snippet:',
        format_item = function(item)
          return string.format('%-20s %s', item.trigger, item.description)
        end,
      }, function(choice)
        if choice then
          -- Insert the snippet trigger and expand
          vim.api.nvim_put({ choice.trigger }, 'c', true, true)
          ls.expand()
        end
      end)
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
    vim.keymap.set({ 'i', 'n' }, '<C-s>', show_snippets, { silent = true, desc = 'Show available snippets' })
  end,
}
