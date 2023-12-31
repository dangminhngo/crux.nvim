local color = require("crux.color")

local builtin = {
  alpha = {
    fg = "#c5d5df",
    bg = "#0d1418",
    red = "#e46769",
    green = "#a4c76f",
    yellow = "#eace60",
    blue = "#619af5",
    magenta = "#9d78d1",
    cyan = "#42b8e6",
    teal = "#5fd7aa",
    orange = "#e39d5f",
    pink = "#d983d7",
  },
  gamma = {
    fg = "#cfcabe",
    bg = "#141617",
    red = "#e67e80",
    green = "#a4c76f",
    yellow = "#d1cc66",
    blue = "#678dc9",
    magenta = "#a183cc",
    cyan = "#76bfc4",
    teal = "#6fc7a4",
    orange = "#d69760",
    pink = "#c975b9",
  },
}

local default = "alpha"

return function(opts)
  local p = builtin[opts.palette or default]

  assert(p.fg ~= nil or p.bg ~= nil, "palette fg and bg must be a color string")
  p.none = "NONE"
  p.accent = p[opts.accent]

  p = vim.tbl_deep_extend("keep", p, {
    dark = color.rel_darken(p.bg, 0.32),
    bg0 = color.rel_darken(p.bg, 0.16),
    bg2 = color.rel_lighten(p.bg, 0.02),
    bg3 = color.rel_lighten(p.bg, 0.06),
    bg4 = color.rel_lighten(p.bg, 0.1),
    fg0 = color.rel_lighten(p.fg, 0.64),
    fg2 = color.rel_darken(p.fg, 0.16),
    fg3 = color.rel_darken(p.fg, 0.32),
    fg4 = color.rel_darken(p.fg, 0.48),
    comment = color.rel_lighten(p.bg, 0.32),
    black = color.rel_lighten(p.bg, 0.2),
    white = color.rel_lighten(p.fg, 0.64),
  })

  p.syntax = {
    attribute = p.yellow, -- HTML tag attribues
    boolean = p.orange, -- Boolean
    punctuation = p.accent, -- Brackets and Punctuation
    builtin0 = p.red, -- Builtin variable
    builtin1 = p.yellow, -- Builtin type
    builtin2 = p.orange, -- Builtin const
    builtin3 = p.red, -- For keywords: return, constructor
    comment = p.comment, -- Comment
    conditional = p.pink, -- Conditional and loop
    constant = p.orange, -- Constants, imports and booleans
    constructor = p.red, -- Constructor, JSX elements
    deprecated = p.black, -- Deprecated
    field = p.teal, -- Field, Property
    func = p.blue, -- Functions and Titles
    identifier = p.pink, -- Identifiers
    keyword = p.magenta, -- Keywords
    number = p.orange, -- Numbers
    operator = p.magenta, -- Operators
    param = p.yellow, -- Params
    preproc = p.magenta, -- PreProc
    regex = p.orange, -- Regex
    statement = p.magenta, -- Statements
    string = p.green, -- Strings
    delimiter = p.teal, -- Tag delimiter
    type = p.yellow, -- Types
    class = p.yellow, -- Classes,
    variable = p.fg, -- Variables
  }
  p.diag = {
    error = p.red,
    warn = p.yellow,
    info = p.green,
    hint = p.blue,
  }
  p.git = {
    added = p.green,
    removed = p.red,
    changed = p.yellow,
    conflict = p.orange,
    ignored = p.comment,
  }
  p.diff = {
    add = p.green,
    delete = p.red,
    change = p.yellow,
    text = p.cyan,
  }

  return vim.tbl_deep_extend("force", p, opts.overrides.palette)
end
