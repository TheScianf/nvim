local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {

  -- Equation
  s(
    { trig = 'eq', dscr = 'Equation environment' },
    fmt(
      [[
\begin{{equation}}
  {}
\end{{equation}}
]],
      { i(1, 'E = mc^2') }
    )
  ),

  -- Figure
  s(
    { trig = 'fig', dscr = 'Figure with caption and label' },
    fmt(
      [[
\begin{{figure}}[h!]
  \centering
  \includegraphics[width={}\\textwidth]{{{}}}
  \caption{{{}}}
  \label{{fig:{} }}
\end{{figure}}
]],
      {
        i(1, '0.8'),
        i(2, 'path/to/image'),
        i(3, 'Caption text'),
        rep(2),
      }
    )
  ),

  -- Table
  s(
    { trig = 'tbl', dscr = 'Table with caption and label' },
    fmt(
      [[
\begin{{table}}[h!]
  \centering
  \begin{{tabular}}{{{}}}
    \hline
    {} \\
    \hline
    {} \\
    \hline
  \end{{tabular}}
  \caption{{{}}}
  \label{{tab:{} }}
\end{{table}}
]],
      {
        i(1, 'l c r'),
        i(2, 'Header1 & Header2 & Header3'),
        i(3, 'Data1 & Data2 & Data3'),
        i(4, 'Caption text'),
        rep(4),
      }
    )
  ),

  -- Itemized list
  s(
    { trig = 'itm', dscr = 'Itemized list' },
    fmt(
      [[
\begin{{itemize}}
  \item {}
  \item {}
  \item {}
\end{{itemize}}
]],
      {
        i(1, 'First item'),
        i(2, 'Second item'),
        i(3, 'Third item'),
      }
    )
  ),

  -- Enumerated list
  s(
    { trig = 'enum', dscr = 'Enumerated list' },
    fmt(
      [[
\begin{{enumerate}}
  \item {}
  \item {}
  \item {}
\end{{enumerate}}
]],
      {
        i(1, 'First item'),
        i(2, 'Second item'),
        i(3, 'Third item'),
      }
    )
  ),

  -- Theorem
  s(
    { trig = 'thm', dscr = 'Theorem environment' },
    fmt(
      [[
\begin{{theorem}}[{}]
  {}
\end{{theorem}}
]],
      {
        i(1, 'Theorem title'),
        i(2, 'Statement of the theorem.'),
      }
    )
  ),

  -- Proof
  s(
    { trig = 'pf', dscr = 'Proof environment' },
    fmt(
      [[
\begin{{proof}}[{}]
  {}
\end{{proof}}
]],
      {
        i(1, 'Proof.'),
        i(2, 'Here goes the reasoning...'),
      }
    )
  ),

  -- Inline math
  s({ trig = 'mm', dscr = 'Inline math mode' }, fmt([[$ {} $]], { i(1, 'E = mc^2') })),

  -- Display math (align*)
  s(
    { trig = 'dm', dscr = 'Display math (align*)' },
    fmt(
      [[
\begin{{align*}}
  {} &= {} \\
  {} &= {}
\end{{align*}}
]],
      {
        i(1, 'a + b'),
        i(2, 'c'),
        i(3, 'E'),
        i(4, 'mc^2'),
      }
    )
  ),

  -- Citation
  s({ trig = 'cite', dscr = 'Citation command' }, fmt([[ \cite{{{}}} ]], { i(1, 'author2025') })),

  -- Reference
  s({ trig = 'ref', dscr = 'Reference command' }, fmt([[ \ref{{{}}} ]], { i(1, 'fig:label') })),

  -- Section
  s(
    { trig = 'sec', dscr = 'Insert a section' },
    fmt(
      [[
\section{{{}}}
{}
]],
      {
        i(1, 'Section title'),
        i(2, 'Section content...'),
      }
    )
  ),

  -- Subsection
  s(
    { trig = 'ssec', dscr = 'Insert a subsection' },
    fmt(
      [[
\subsection{{{}}}
{}
]],
      {
        i(1, 'Subsection title'),
        i(2, 'Subsection content...'),
      }
    )
  ),

  -- Subsubsection
  s(
    { trig = 'sssec', dscr = 'Insert a subsubsection' },
    fmt(
      [[
\subsubsection{{{}}}
{}
]],
      {
        i(1, 'Subsubsection title'),
        i(2, 'Subsubsection content...'),
      }
    )
  ),

  -- Paragraph
  s(
    { trig = 'para', dscr = 'Insert a paragraph heading' },
    fmt(
      [[
\paragraph{{{}}}
{}
]],
      {
        i(1, 'Paragraph heading'),
        i(2, 'Paragraph content...'),
      }
    )
  ),
}
