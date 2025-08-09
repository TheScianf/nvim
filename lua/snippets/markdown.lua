local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep
return {
  s({ trig = 'link', dscr = '[Link](url_or_file)' }, fmt('[{}]({})', { i(1), i(2) })),
  s({ trig = 'img', dscr = '![Img name](file)' }, fmt('![{}]({})', { i(1), i(2) })),
  s({ trig = '(%d+)ind', regTrig = true, dscr = 'Index of content' }, {
    d(1, function(_, snip)
      local num = tonumber(snip.captures[1])
      local nodes = {}
      -- Add Content header at the top
      table.insert(nodes, t '## Content')
      table.insert(nodes, t { '', '' })
      -- Generate the table of contents links
      for j = 1, num do
        table.insert(nodes, t '- [')
        table.insert(nodes, i(j)) -- Use sequential numbering
        table.insert(nodes, t '](#')
        table.insert(
          nodes,
          f(function(args)
            -- Handle nil values safely
            if args[1] and args[1][1] then
              return args[1][1]:lower():gsub(' ', '-')
            else
              return ''
            end
          end, { j })
        )
        table.insert(nodes, t ')')
        if j < num then
          table.insert(nodes, t { '', '' })
        end
      end

      -- Add headers
      table.insert(nodes, t { '', '' })
      for j = 1, num do
        table.insert(nodes, t '### ')
        table.insert(nodes, rep(j)) -- Use rep to repeat the input
        if j < num then
          table.insert(nodes, t { '', '' })
        end
      end

      -- Final cursor position
      table.insert(nodes, t { '', '' })
      table.insert(nodes, i(num + 1)) -- Final position after all sections

      return sn(nil, nodes)
    end),
  }),

  -- Dynamic ordered list (numbered)
  s({ trig = '(%d+)li', regTrig = true, dscr = 'Ordered list' }, {
    d(1, function(_, snip)
      local num = tonumber(snip.captures[1])
      local nodes = {}

      for j = 1, num do
        table.insert(nodes, t(j .. '. '))
        table.insert(nodes, i(j))
        if j < num then
          table.insert(nodes, t { '', '' })
        end
      end

      -- Final cursor position
      table.insert(nodes, t { '', '' })
      table.insert(nodes, i(num + 1))

      return sn(nil, nodes)
    end),
  }),

  -- Dynamic unordered list (bullets)
  s({ trig = '(%d+)uli', regTrig = true, dscr = 'Unordered list' }, {
    d(1, function(_, snip)
      local num = tonumber(snip.captures[1])
      local nodes = {}

      for j = 1, num do
        table.insert(nodes, t '- ')
        table.insert(nodes, i(j))
        if j < num then
          table.insert(nodes, t { '', '' })
        end
      end

      -- Final cursor position
      table.insert(nodes, t { '', '' })
      table.insert(nodes, i(num + 1))

      return sn(nil, nodes)
    end),
  }),
  s(
    { trig = 'bcd', dscr = 'Block code' },
    fmt(
      [[
```{}
{}
```]],
      {
        i(1, 'bash'),
        i(0),
      }
    )
  ),
  -- Inline code
  s({ trig = 'icd', dscr = 'Inline code' }, fmt('`{}`', { i(1) })),
  s({ trig = '(%d+)x(%d+)t', regTrig = true, dscr = 'Table' }, {
    d(1, function(_, snip)
      local rows = tonumber(snip.captures[1])
      local cols = tonumber(snip.captures[2])
      local nodes = {}
      local insert_count = 0

      -- Create header row
      table.insert(nodes, t '|')
      for col = 1, cols do
        insert_count = insert_count + 1
        table.insert(nodes, t ' ')
        table.insert(nodes, i(insert_count))
        table.insert(nodes, t ' |')
      end
      table.insert(nodes, t { '', '' })

      -- Create separator row
      table.insert(nodes, t '|')
      for col = 1, cols do
        table.insert(nodes, t ' --- |')
      end
      table.insert(nodes, t { '', '' })

      -- Create data rows
      for row = 1, rows do
        table.insert(nodes, t '|')
        for col = 1, cols do
          insert_count = insert_count + 1
          table.insert(nodes, t ' ')
          table.insert(nodes, i(insert_count))
          table.insert(nodes, t ' |')
        end
        if row < rows then
          table.insert(nodes, t { '', '' })
        end
      end

      -- Final cursor position
      table.insert(nodes, t { '', '' })
      table.insert(nodes, i(insert_count + 1))

      return sn(nil, nodes)
    end),
  }),
}
