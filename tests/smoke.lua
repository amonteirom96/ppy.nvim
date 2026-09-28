-- nvim --headless -u NONE --cmd "set rtp^=." -l tests/smoke.lua
local ok_all = true
local function check(cond, msg)
  if not cond then ok_all = false; print("FAIL: " .. msg) end
end

vim.env.XDG_CACHE_HOME = vim.fn.tempname()
local ppy = require("ppy")

local function hl(g)
  return vim.api.nvim_get_hl(0, { name = g, link = false })
end
local function int(hex)
  return tonumber(hex:sub(2), 16)
end

for _, name in ipairs({ "ppy-light", "ppy-dark", "ppy" }) do
  local ok, err = pcall(vim.cmd.colorscheme, name)
  check(ok, name .. ": " .. tostring(err))
  check(vim.g.colors_name == name, name .. ": colors_name=" .. tostring(vim.g.colors_name))
  local normal = hl("Normal")
  check(normal.fg and normal.bg, name .. ": Normal has fg/bg")
  -- the JetBrains editor scheme, verbatim
  check(hl("Keyword").fg == 0xfb7385, name .. ": pink keywords")
  check(hl("Type").fg == 0x61afef, name .. ": blue types")
  check(hl("@function.call").fg == 0x98c379, name .. ": green calls")
  check(hl("String").fg == 0xe5bc66, name .. ": yellow strings")
  check(hl("Number").fg == 0xce95b8, name .. ": magenta numbers")
  check(hl("@type.builtin").fg == hl("Keyword").fg, name .. ": builtin types are keywords")
  check(hl("@boolean").fg == hl("Keyword").fg, name .. ": booleans are keywords")
  check(hl("Comment").italic, name .. ": italic comments")
  check(hl("PreProc").bg == 0xd080fb, name .. ": purple preprocessor block")
  check(hl("@comment.todo").bold and hl("@comment.todo").bg, name .. ": TODO block")
  check(hl("@punctuation.delimiter.semicolon").fg ~= normal.fg, name .. ": faded semicolons")
  -- statusline groups ship with the theme
  check(hl("StGit").fg == hl("GitSignsAdd").fg, name .. ": StGit uses git add")
  check(hl("StModeNormal").bg ~= nil, name .. ": StModeNormal")
  -- color where it matters
  local add, del = hl("GitSignsAdd").fg, hl("GitSignsDelete").fg
  check(add and del and add ~= del, name .. ": gitsigns colored")
  check(hl("BlinkCmpKindFunction").fg ~= hl("BlinkCmpKindClass").fg, name .. ": kinds differ")
  check(hl("MiniIconsRed").fg ~= nil, name .. ": mini.icons")
  check(vim.g.terminal_color_1 ~= nil, name .. ": terminal colors")
end

-- light and dark differ where the original schemes differ
vim.cmd.colorscheme("ppy-light")
check(hl("@function").fg == 0x70e021, "light: bright green declarations")
check(hl("@variable.parameter").fg == 0x23b5ff, "light: blue parameters")
vim.cmd.colorscheme("ppy-dark")
check(hl("Normal").bg == 0x20202a, "dark: bg")

-- background switch follows for "ppy"
vim.cmd.colorscheme("ppy")
vim.o.background = "light"
check(hl("Normal").bg == int(ppy.colors("light").bg), "auto variant follows background=light")
vim.o.background = "dark"
check(hl("Normal").bg == int(ppy.colors("dark").bg), "auto variant follows background=dark")

-- semicolon query extends the bundled C highlights without errors
local b = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(b, 0, -1, false, { "int main(void) { return 0; }" })
vim.treesitter.start(b, "c")
vim.treesitter.get_parser(b):parse()
local caps = vim.tbl_map(function(x)
  return x.capture
end, vim.treesitter.get_captures_at_pos(b, 0, 25))
check(caps[#caps] == "punctuation.delimiter.semicolon", "semicolon capture wins: " .. table.concat(caps, ","))

-- cache written and setup invalidates key
local dir = vim.fn.stdpath("cache") .. "/ppy"
check(#vim.fn.readdir(dir) >= 3, "cache files exist")
ppy.setup({ transparent = true })
vim.cmd.colorscheme("ppy-dark")
check(hl("Normal").bg == nil, "transparent applied after setup")
ppy.setup({ on_highlights = function(h) h.Normal.fg = "#ff0000" end })
vim.cmd.colorscheme("ppy-dark")
check(hl("Normal").fg == 0xff0000, "on_highlights applied")
ppy.setup({ dim_semicolons = false })
vim.cmd.colorscheme("ppy-dark")
check(hl("@punctuation.delimiter.semicolon").fg == hl("Normal").fg, "dim_semicolons = false")
ppy.setup({ on_colors = function(c) c.code.keyword = "#123456" end })
vim.cmd.colorscheme("ppy-dark")
check(hl("Keyword").fg == 0x123456, "on_colors applied")

-- highlights never produce invalid specs
ppy.setup({})
for _, v in ipairs({ "light", "dark" }) do
  for n, spec in pairs(ppy.highlights(v)) do
    for _, k in ipairs({ "fg", "bg", "sp" }) do
      local x = spec[k]
      check(x == nil or x == "NONE" or (type(x) == "string" and x:match("^#%x%x%x%x%x%x$")), ("%s %s.%s=%s"):format(v, n, k, tostring(x)))
    end
  end
end

print(ok_all and "ALL OK" or "FAILURES")
if not ok_all then os.exit(1) end
