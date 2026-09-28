local util = require("ppy.util")

local M = {}

--- The light theme ships its own base/lighter ANSI pairs ($baseRed/$lighterRed…).
local LIGHT_BRIGHT = {
  red = "#c33732",
  green = "#83be2f",
  yellow = "#dda536",
  blue = "#2978b9",
  magenta = "#cd357b",
  cyan = "#1dbaba",
}

--- ANSI 16-color table derived from the palette. Used by `:terminal` and by the
--- ghostty/kitty extras, so the editor and the terminal always match.
---@param c ppy.Colors
---@return string[] 0-indexed colors
function M.ansi(c)
  if c.variant == "light" then
    local b = LIGHT_BRIGHT
    return {
      [0] = c.ui.fg,
      c.red,
      c.green,
      c.yellow,
      c.blue,
      c.magenta,
      c.cyan,
      c.ui.header,
      c.muted,
      b.red,
      b.green,
      b.yellow,
      b.blue,
      b.magenta,
      b.cyan,
      c.ui.panel,
    }
  end

  local function bright(x)
    return util.lighten(x, 0.18)
  end
  return {
    [0] = c.ui.panel,
    c.red,
    c.green,
    c.yellow,
    c.blue,
    c.purple,
    c.cyan,
    c.fg,
    c.muted,
    bright(c.red),
    bright(c.green),
    bright(c.yellow),
    bright(c.blue),
    bright(c.purple),
    bright(c.cyan),
    c.code.variable,
  }
end

return M
