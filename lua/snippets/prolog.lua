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
  s({ trig = 'ru', dscr = 'Rule with head and body' }, fmt('{}({}) :- {}.', { i(1), i(2), i(3) })),
  s({ trig = 'fc', dscr = 'Predicate' }, fmt('{}({}).', { i(1), i(2) })),
  s({ trig = 'inc', dscr = 'Include file' }, fmt('#include "{}".', { i(1) })),
  s({ trig = 'sw', dscr = 'Show' }, fmt('#show {}/{}.', { i(1), i(2) })),
  s({ trig = 'scn', dscr = 'Section' }, fmt('%---------------------{}---------------------', { i(1) })),
}
