local config = require("crux.config")
local palette = require("crux.palette")
local theme = require("crux.theme")

local _crux = {}

function _crux.load()
  config.extend(config.opts)
  local p = palette(config.opts)
  theme.setup(p, config.opts)
end

_crux.setup = config.setup

return _crux
