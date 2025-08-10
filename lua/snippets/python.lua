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
  s(
    {
      trig = 'main',
      dscr = "main function with if __name__ == '__main__' guard",
    },
    fmt(
      [[
  def main() -> None:
      {}


  if __name__ == "__main__":
      main()
]],
      {
        i(1, '...'),
      }
    )
  ),
  -- If statement
  s(
    {
      trig = 'if',
      dscr = 'if statement',
    },
    fmt(
      [[
    if {}:
        {}
  ]],
      {
        i(1, 'condition'),
        i(2, '...'),
      }
    )
  ),
  -- If-else statement
  s(
    {
      trig = 'ife',
      dscr = 'if-else statement',
    },
    fmt(
      [[
    if {}:
        {}
    else:
        {}
  ]],
      {
        i(1, 'condition'),
        i(2, '...'),
        i(3, '...'),
      }
    )
  ),

  -- If-elif-else statement
  s(
    {
      trig = 'ifel',
      dscr = 'if-elif-else statement',
    },
    fmt(
      [[
    if {}:
        {}
    elif {}:
        {}
    else:
        {}
  ]],
      {
        i(1, 'condition1'),
        i(2, '...'),
        i(3, 'condition2'),
        i(4, '...'),
        i(5, '...'),
      }
    )
  ),
  -- For loop with range
  s(
    {
      trig = 'for',
      dscr = 'for loop with range',
    },
    fmt(
      [[
    for {} in range({}):
        {}
  ]],
      {
        i(1, 'i'),
        i(2, '10'),
        i(3, '...'),
      }
    )
  ),

  -- For loop with iterable
  s(
    {
      trig = 'fori',
      dscr = 'for loop with iterable',
    },
    fmt(
      [[
    for {} in {}:
        {}
  ]],
      {
        i(1, 'item'),
        i(2, 'iterable'),
        i(3, '...'),
      }
    )
  ),

  -- For loop with enumerate
  s(
    {
      trig = 'fore',
      dscr = 'for loop with enumerate',
    },
    fmt(
      [[
    for {}, {} in enumerate({}):
        {}
  ]],
      {
        i(1, 'i'),
        i(2, 'item'),
        i(3, 'iterable'),
        i(4, '...'),
      }
    )
  ),

  -- While loop
  s(
    {
      trig = 'while',
      dscr = 'while loop',
    },
    fmt(
      [[
    while {}:
        {}
  ]],
      {
        i(1, 'condition'),
        i(2, '...'),
      }
    )
  ),

  -- Match statement (Python 3.10+)
  s(
    {
      trig = 'match',
      dscr = 'match statement',
    },
    fmt(
      [[
    match {}:
        case {}:
            {}
        case _:
            {}
  ]],
      {
        i(1, 'value'),
        i(2, 'pattern'),
        i(3, '...'),
        i(4, '...'),
      }
    )
  ),

  -- Match with multiple cases
  s(
    {
      trig = 'matchm',
      dscr = 'match statement with multiple cases',
    },
    fmt(
      [[
    match {}:
        case {}:
            {}
        case {}:
            {}
        case _:
            {}
  ]],
      {
        i(1, 'value'),
        i(2, 'pattern1'),
        i(3, '...'),
        i(4, 'pattern2'),
        i(5, '...'),
        i(6, '...'),
      }
    )
  ),

  -- Try-except
  s(
    {
      trig = 'try',
      dscr = 'try-except block',
    },
    fmt(
      [[
    try:
        {}
    except {}:
        {}
  ]],
      {
        i(1, '...'),
        i(2, 'Exception'),
        i(3, '...'),
      }
    )
  ),

  -- Try-except-finally
  s(
    {
      trig = 'tryf',
      dscr = 'try-except-finally block',
    },
    fmt(
      [[
    try:
        {}
    except {}:
        {}
    finally:
        {}
  ]],
      {
        i(1, '...'),
        i(2, 'Exception'),
        i(3, '...'),
        i(4, '...'),
      }
    )
  ),

  -- Function definition
  s(
    {
      trig = 'def',
      dscr = 'function definition',
    },
    fmt(
      [[
    def {}({}) -> {}:
        {}
  ]],
      {
        i(1, 'function_name'),
        i(2, 'args'),
        i(3, 'None'),
        i(4, '...'),
      }
    )
  ),

  s(
    {
      trig = 'adef',
      dscr = 'async function definition',
    },
    fmt(
      [[
    async def {}({}) -> {}:
        {}
  ]],
      {
        i(1, 'function_name'),
        i(2, 'args'),
        i(3, 'None'),
        i(4, '...'),
      }
    )
  ),

  -- Lambda function
  s(
    {
      trig = 'lambda',
      dscr = 'lambda function',
    },
    fmt(
      [[
  lambda {}: {}
]],
      {
        i(1, 'args'),
        i(2, 'expression'),
      }
    )
  ),
  -- Class definition
  s(
    {
      trig = 'class',
      dscr = 'class definition',
    },
    fmt(
      [[
    class {}:
        def __init__(self{}):
            {}
  ]],
      {
        i(1, 'ClassName'),
        i(2, ''),
        i(3, '...'),
      }
    )
  ),

  -- List comprehension
  s(
    {
      trig = 'lc',
      dscr = 'list comprehension',
    },
    fmt(
      [[
    [{} for {} in {}]
  ]],
      {
        i(1, 'item'),
        i(2, 'item'),
        i(3, 'iterable'),
      }
    )
  ),

  -- Dictionary comprehension
  s(
    {
      trig = 'dc',
      dscr = 'dictionary comprehension',
    },
    fmt(
      [[
    {{{}: {} for {} in {}}}
  ]],
      {
        i(1, 'key'),
        i(2, 'value'),
        i(3, 'item'),
        i(4, 'iterable'),
      }
    )
  ),

  -- With statement
  s(
    {
      trig = 'with',
      dscr = 'with statement',
    },
    fmt(
      [[
    with {} as {}:
        {}
  ]],
      {
        i(1, 'expression'),
        i(2, 'variable'),
        i(3, '...'),
      }
    )
  ),

  -- Ternary operator
  s({
    trig = 'tern',
    dscr = 'Ternary operator',
  }, fmt('{} if {} else {}', { i(1, 'value_if_true'), i(2, 'condition'), i(3, 'value_if_false') })),
}
