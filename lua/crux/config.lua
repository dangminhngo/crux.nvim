local palette = require("crux.palette")

local _config = {}

local default = {
  palette = "alpha",
  accent = "green",
  transparent = false,
  terminal_colors = true,
  styles = {
    attributes = { italic = true },
    booleans = { italic = true },
    comments = { italic = true },
    functions = {},
    keywords = {},
    numbers = {},
    parameters = {},
    strings = {},
    types = {},
    variables = {},
  },
  reverse = {
    match_paren = false,
    visual = false,
    search = false,
  },
  syntax = {
    attr = "yellow", -- HTML tag attribues
    bool = "orange", -- Boolean
    bracket = "fg2", -- Brackets and Punctuation
    builtin0 = "red", -- Builtin variable
    builtin1 = "yellow", -- Builtin type
    builtin2 = "orange", -- Builtin const
    builtin3 = "red", -- For keywords: return, constructor
    comment = "comment", -- Comment
    conditional = "pink", -- Conditional and loop
    const = "orange", -- Constants, imports and booleans
    constructor = "red", -- Constructor, JSX elements
    dep = "black", -- Deprecated
    field = "teal", -- Field, Property
    func = "blue", -- Functions and Titles
    ident = "pink", -- Identifiers
    keyword = "magenta", -- Keywords
    number = "orange", -- Numbers
    operator = "magenta", -- Operators
    param = "yellow", -- Params
    preproc = "magenta", -- PreProc
    regex = "orange", -- Regex
    statement = "magenta", -- Statements
    string = "green", -- Strings
    delimiter = "teal", -- Tag delimiter
    type = "yellow", -- Types
    variable = "fg", -- Variables
  },
  diag = {
    error = "red",
    warn = "yellow",
    info = "cyan",
    hint = "green",
  },
  git = {
    added = "green",
    removed = "red",
    changed = "yellow",
    conflict = "orange",
    ignored = "pink",
  },
  diff = {
    add = "green",
    delete = "red",
    change = "yellow",
    text = "cyan",
  },
  groups = {},
  plugins = {
    alpha = true,
    barbar = true,
    bufferline = true,
    dashboard = true,
    diff = true,
    gitsigns = true,
    hop = true,
    indent_blankline = true,
    lazy = true,
    leap = true,
    lspsaga = true,
    mini = true,
    neo_tree = true,
    nvim_cmp = true,
    nvim_navic = true,
    nvim_notify = true,
    nvim_tree = true,
    nvim_ts_rainbow = true,
    nvim_ts_rainbow2 = true,
    nvim_scrollbar = true,
    telescope = true,
    trouble = true,
    vim_gitgutter = true,
    vim_illuminate = true,
    vim_sneak = true,
    which_key = true,
    yanky = true,
  },
}

_config.opts = {}

function _config.setup(opts)
  _config.opts = vim.tbl_deep_extend("force", {}, default, opts or {})
end

return _config
