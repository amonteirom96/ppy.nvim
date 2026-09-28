-- Reports WCAG contrast of every palette color against its background.
-- The colors are Dean Herbert's originals, kept as-is, so this is a report,
-- not a gate: only the base text (fg on bg) must pass AA.
-- Usage: nvim --headless -u NONE --cmd "set rtp^=." -l scripts/contrast.lua

local util = require("ppy.util")
local palette = require("ppy.palette")

local MIN_TEXT = 4.5
local accents = { "red", "orange", "yellow", "green", "cyan", "azure", "blue", "purple", "pink", "magenta" }
local code = { "keyword", "type", "func", "func_decl", "variable", "parameter", "constant", "string", "number", "comment", "semicolon" }
local failed = false

local function mark(r)
  return r >= MIN_TEXT and "AA" or r >= 3 and "large" or "low"
end

for _, variant in ipairs({ "light", "dark" }) do
  local c = palette.get(variant, {})
  print(("\n%s  bg=%s"):format(variant:upper(), c.bg))
  local r = util.contrast(c.fg, c.bg)
  failed = failed or r < MIN_TEXT
  print(("  %-10s %s  %5.2f  %s"):format("fg", c.fg, r, r >= MIN_TEXT and "ok" or "FAIL"))
  for _, k in ipairs(accents) do
    r = util.contrast(c[k], c.bg)
    print(("  %-10s %s  %5.2f  %s"):format(k, c[k], r, mark(r)))
  end
  for _, k in ipairs(code) do
    r = util.contrast(c.code[k], c.bg)
    print(("  %-10s %s  %5.2f  %s  (code)"):format(k, c.code[k], r, mark(r)))
  end
end

if failed then
  os.exit(1)
end
