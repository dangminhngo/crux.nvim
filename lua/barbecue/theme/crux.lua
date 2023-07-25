local palette = require("crux.palette")

local p = palette()

return {
  normal = { fg = p.fg3, bg = p.dark },

  ellipsis = { fg = p.bg4 },
  separator = { fg = p.bg4 },
  modified = { fg = p.diag.warn },

  dirname = { fg = p.bg4 },
  basename = { fg = p.fg3, bold = true },
  context = { fg = p.fg3 },

  context_file = { fg = p.fg3 },
  context_module = { fg = p.yellow },
  context_namespace = { fg = p.yellow },
  context_package = { fg = p.blue },
  context_class = { fg = p.orange },
  context_method = { fg = p.blue },
  context_property = { fg = p.teal },
  context_field = { fg = p.teal },
  context_constructor = { fg = p.blue },
  context_enum = { fg = p.orange },
  context_interface = { fg = p.orange },
  context_function = { fg = p.blue },
  context_variable = { fg = p.magenta },
  context_constant = { fg = p.magenta },
  context_string = { fg = p.green },
  context_number = { fg = p.orange },
  context_boolean = { fg = p.orange },
  context_array = { fg = p.orange },
  context_object = { fg = p.orange },
  context_key = { fg = p.purple },
  context_null = { fg = p.cyan },
  context_enum_member = { fg = p.teal },
  context_struct = { fg = p.orange },
  context_event = { fg = p.orange },
  context_operator = { fg = p.teal },
  context_type_parameter = { fg = p.teal },
}
