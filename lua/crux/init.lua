local config = require("crux.config")
local theme = require("crux.theme")

local _crux = {}

function _crux.load(opts)
  opts = opts or {}
  config.extend(opts)
  theme.setup()
end

_crux.setup = config.setup

return _crux
