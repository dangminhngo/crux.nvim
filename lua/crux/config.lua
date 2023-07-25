local _config = {}

local default = {
  palette = "alpha",
  accent = "green",
  transparent = false,
  term = true,
  diagnostic = {
    background = false,
  },
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
  overrides = {
    palette = {},
    groups = {},
  },
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
  _config.opts = vim.tbl_deep_extend("force", default, opts or {})
end

function _config.extend(opts)
  _config.opts = vim.tbl_deep_extend("force", _config.opts or default, opts or {})
end

_config.setup()

return _config
