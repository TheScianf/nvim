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
  -- Package declaration
  s({ trig = 'package', dscr = 'Package declaration' }, fmt('package {}', { i(1, 'com.example') })),

  -- Import statement
  s({ trig = 'import', dscr = 'Import statement' }, fmt('import {}', { i(1, 'kotlin.collections.*') })),

  -- Main function (without args)
  s(
    { trig = 'main', dscr = 'Main function' },
    fmt(
      [[
fun main() {{
    {}
}}]],
      { i(1, 'println("Hello world!")') }
    )
  ),

  -- Function declaration
  s(
    { trig = 'fun', dscr = 'Function declaration' },
    fmt(
      [[
fun {}({}): {} {{
    {}
}}]],
      {
        i(1, 'functionName'),
        i(2, 'param: Type'),
        i(3, 'ReturnType'),
        i(4, '// function body'),
      }
    )
  ),

  -- Function with expression body
  s(
    { trig = 'funx', dscr = 'Function with expression body' },
    fmt('fun {}({}) = {}', {
      i(1, 'functionName'),
      i(2, 'param: Type'),
      i(3, 'expression'),
    })
  ),

  -- Val declaration
  s(
    { trig = 'val', dscr = 'Val declaration' },
    fmt('val {}: {} = {}', {
      i(1, 'name'),
      i(2, 'Type'),
      i(3, 'value'),
    })
  ),

  -- Var declaration
  s(
    { trig = 'var', dscr = 'Var declaration' },
    fmt('var {}: {} = {}', {
      i(1, 'name'),
      i(2, 'Type'),
      i(3, 'value'),
    })
  ),

  -- Class declaration
  s(
    { trig = 'class', dscr = 'Class declaration' },
    fmt(
      [[
class {}({}) {{
    {}
}}]],
      {
        i(1, 'ClassName'),
        i(2, 'val property: Type'),
        i(3, '// class body'),
      }
    )
  ),

  -- Class inheritance
  s(
    { trig = 'classi', dscr = 'Class with inheritance' },
    fmt(
      [[
class {}({}): {}() {{
    {}
}}]],
      {
        i(1, 'ClassName'),
        i(2, 'val property: Type'),
        i(3, 'BaseClass'),
        i(4, '// class body'),
      }
    )
  ),

  -- If statement
  s(
    { trig = 'if', dscr = 'If statement' },
    fmt(
      [[
if ({}) {{
    {}
}}]],
      {
        i(1, 'condition'),
        i(2, '// body'),
      }
    )
  ),

  -- If-else statement
  s(
    { trig = 'ifelse', dscr = 'If-else statement' },
    fmt(
      [[
if ({}) {{
    {}
}} else {{
    {}
}}]],
      {
        i(1, 'condition'),
        i(2, '// if body'),
        i(3, '// else body'),
      }
    )
  ),

  -- If expression
  s(
    { trig = 'ifx', dscr = 'If expression' },
    fmt('if ({}) {} else {}', {
      i(1, 'condition'),
      i(2, 'value1'),
      i(3, 'value2'),
    })
  ),

  -- When expression
  s(
    { trig = 'when', dscr = 'When expression' },
    fmt(
      [[
when ({}) {{
    {} -> {}
    {} -> {}
    else -> {}
}}]],
      {
        i(1, 'expression'),
        i(2, 'condition1'),
        i(3, 'result1'),
        i(4, 'condition2'),
        i(5, 'result2'),
        i(6, 'defaultResult'),
      }
    )
  ),

  -- When without argument
  s(
    { trig = 'whens', dscr = 'When without argument' },
    fmt(
      [[
when {{
    {} -> {}
    {} -> {}
    else -> {}
}}]],
      {
        i(1, 'condition1'),
        i(2, 'result1'),
        i(3, 'condition2'),
        i(4, 'result2'),
        i(5, 'defaultResult'),
      }
    )
  ),

  -- For loop (in collection)
  s(
    { trig = 'for', dscr = 'For loop (in collection)' },
    fmt(
      [[
for ({} in {}) {{
    {}
}}]],
      {
        i(1, 'item'),
        i(2, 'collection'),
        i(3, '// loop body'),
      }
    )
  ),

  -- For loop with indices
  s(
    { trig = 'fori', dscr = 'For loop with indices' },
    fmt(
      [[
for ({} in {}.indices) {{
    {}
}}]],
      {
        i(1, 'index'),
        i(2, 'collection'),
        i(3, '// loop body'),
      }
    )
  ),

  -- For loop with range
  s(
    { trig = 'forr', dscr = 'For loop with range' },
    fmt(
      [[
for ({} in {}..{}) {{
    {}
}}]],
      {
        i(1, 'i'),
        i(2, 'start'),
        i(3, 'end'),
        i(4, '// loop body'),
      }
    )
  ),

  -- For loop with step
  s(
    { trig = 'fors', dscr = 'For loop with step' },
    fmt(
      [[
for ({} in {}..{} step {}) {{
    {}
}}]],
      {
        i(1, 'i'),
        i(2, 'start'),
        i(3, 'end'),
        i(4, 'step'),
        i(5, '// loop body'),
      }
    )
  ),

  -- For loop downTo
  s(
    { trig = 'ford', dscr = 'For loop downTo' },
    fmt(
      [[
for ({} in {} downTo {} step {}) {{
    {}
}}]],
      {
        i(1, 'i'),
        i(2, 'start'),
        i(3, 'end'),
        i(4, 'step'),
        i(5, '// loop body'),
      }
    )
  ),

  -- While loop
  s(
    { trig = 'while', dscr = 'While loop' },
    fmt(
      [[
while ({}) {{
    {}
}}]],
      {
        i(1, 'condition'),
        i(2, '// loop body'),
      }
    )
  ),

  -- Try-catch
  s(
    { trig = 'try', dscr = 'Try-catch block' },
    fmt(
      [[
try {{
    {}
}} catch (e: {}) {{
    {}
}}]],
      {
        i(1, '// try block'),
        i(2, 'Exception'),
        i(3, '// catch block'),
      }
    )
  ),

  -- Lambda expression
  s(
    { trig = 'lambda', dscr = 'Lambda expression' },
    fmt('{{ {} -> {} }}', {
      i(1, 'param'),
      i(2, 'expression'),
    })
  ),

  -- List creation
  s({ trig = 'list', dscr = 'List creation' }, fmt('listOf({})', { i(1, '"item1", "item2"') })),

  -- Mutable list
  s({ trig = 'mlist', dscr = 'Mutable list creation' }, fmt('mutableListOf({})', { i(1, '"item1", "item2"') })),

  -- Set creation
  s({ trig = 'set', dscr = 'Set creation' }, fmt('setOf({})', { i(1, '"item1", "item2"') })),

  -- Map creation
  s({ trig = 'map', dscr = 'Map creation' }, fmt('mapOf({})', { i(1, '"key1" to "value1", "key2" to "value2"') })),

  -- Elvis operator
  s(
    { trig = 'elvis', dscr = 'Elvis operator' },
    fmt('{} ?: {}', {
      i(1, 'nullableValue'),
      i(2, 'defaultValue'),
    })
  ),

  -- Type check (is)
  s(
    { trig = 'is', dscr = 'Type check (is)' },
    fmt(
      [[
if ({} is {}) {{
    {}
}}]],
      {
        i(1, 'obj'),
        i(2, 'String'),
        i(3, '// obj is String here'),
      }
    )
  ),

  -- Type check (not is)
  s(
    { trig = 'nis', dscr = 'Type check (not is)' },
    fmt('if ({} !is {}) return', {
      i(1, 'obj'),
      i(2, 'String'),
    })
  ),

  -- Range check (in)
  s(
    { trig = 'in', dscr = 'Range check (in)' },
    fmt(
      [[
if ({} in {}) {{
    {}
}}]],
      {
        i(1, 'value'),
        i(2, '1..10'),
        i(3, '// in range'),
      }
    )
  ),

  -- Range check (not in)
  s(
    { trig = 'nin', dscr = 'Range check (not in)' },
    fmt(
      [[
if ({} !in {}) {{
    {}
}}]],
      {
        i(1, 'value'),
        i(2, '0..list.lastIndex'),
        i(3, '// out of range'),
      }
    )
  ),

  -- Data class
  s(
    { trig = 'data', dscr = 'Data class' },
    fmt('data class {}({})', {
      i(1, 'ClassName'),
      i(2, 'val property: Type'),
    })
  ),

  -- Enum class
  s(
    { trig = 'enum', dscr = 'Enum class' },
    fmt(
      [[
enum class {} {{
    {},
    {}
}}]],
      {
        i(1, 'EnumName'),
        i(2, 'VALUE1'),
        i(3, 'VALUE2'),
      }
    )
  ),

  -- Object declaration
  s(
    { trig = 'object', dscr = 'Object declaration' },
    fmt(
      [[
object {} {{
    {}
}}]],
      {
        i(1, 'ObjectName'),
        i(2, '// object body'),
      }
    )
  ),

  -- Companion object
  s(
    { trig = 'companion', dscr = 'Companion object' },
    fmt(
      [[
companion object {{
    {}
}}]],
      { i(1, '// companion object body') }
    )
  ),

  -- Interface
  s(
    { trig = 'interface', dscr = 'Interface declaration' },
    fmt(
      [[
interface {} {{
    fun {}(): {}
}}]],
      {
        i(1, 'InterfaceName'),
        i(2, 'methodName'),
        i(3, 'ReturnType'),
      }
    )
  ),

  -- Lambda with multiple parameters
  s(
    { trig = 'lambdam', dscr = 'Lambda with multiple parameters' },
    fmt('{{ {}, {} -> {} }}', {
      i(1, 'param1'),
      i(2, 'param2'),
      i(3, 'expression'),
    })
  ),

  -- Throw statement
  s(
    { trig = 'throw', dscr = 'Throw statement' },
    fmt('throw {}("{}")', {
      i(1, 'Exception'),
      i(2, 'message'),
    })
  ),

  -- Assert statement
  s(
    { trig = 'assert', dscr = 'Assert statement' },
    fmt('assert({}) {{ "{}" }}', {
      i(1, 'condition'),
      i(2, 'message'),
    })
  ),
}
