local helpers = require("lib.helpers")

local color = { mt = {} }

local function new(args)
  local obj = { _props = {} }

  -- Default properties
  obj._props.r = args.r or 0
  obj._props.g = args.g or 0
  obj._props.b = args.b or 0
  obj._props.h = args.h or 0
  obj._props.s = args.s or 0
  obj._props.l = args.l or 0
  obj._props.hex = args.hex or "#000000"

  function obj:hex_to_rgb()
    obj._props.r, obj._props.g, obj._props.b = helpers.hex_to_rgb(obj._props.hex)
  end

  function obj:rgb_to_hex()
    obj._props.hex = helpers.rgb_to_hex(obj._props)
  end

  function obj:rgb_to_hsl()
    obj._props.h, obj._props.s, obj._props.l = helpers.rgb_to_hsl(obj._props)
  end

  function obj:hsl_to_rgb()
    obj._props.r, obj._props.g, obj._props.b = helpers.hsl_to_rgb(obj._props)
  end

  -- Initially set values
  if obj._props.r ~= 0 or obj._props.g ~= 0 or obj._props.b ~= 0 then
    obj:rgb_to_hex()
    obj:rgb_to_hsl()
  elseif obj._props.hex ~= "#000000" then
    obj:hex_to_rgb()
    obj:rgb_to_hsl()
  elseif obj._props.h ~= 0 or obj._props.s ~= 0 or obj._props.l ~= 0 then
    obj:hsl_to_rgb()
    obj:rgb_to_hex()
  end

  return obj._props
end

function color.mt:__call(...)
  return new(...)
end

return setmetatable(color, color.mt)
