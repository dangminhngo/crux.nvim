local palette = require("crux.palette")

local p = palette()

local function mode(color)
  return {
    a = { bg = color, fg = p.bg, gui = "bold" },
    b = { bg = p.bg3, fg = p.accent },
    c = { bg = p.dark, fg = p.black },
  }
end

return {
  normal = mode(p.accent),
  insert = mode(p.yellow),
  command = mode(p.magenta),
  visual = mode(p.blue),
  replace = mode(p.red),
  inactive = mode(p.fg3),
}
