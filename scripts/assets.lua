-- Renders assets/banner.svg and assets/preview.svg from the real palette.
-- Usage: nvim --headless -u NONE --cmd "set rtp^=." -l scripts/assets.lua

local ppy = require("ppy")
local util = require("ppy.util")
local L, D = ppy.colors("light"), ppy.colors("dark")

local FONT = "'JetBrains Mono','SF Mono','Cascadia Code',Menlo,Consolas,monospace"
local SANS = "'Inter','SF Pro Display','Segoe UI',Helvetica,Arial,sans-serif"
local fmt, concat = string.format, table.concat

local function esc(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local function write(path, s)
  local f = assert(io.open(path, "w"))
  f:write(s)
  f:close()
end

-- The editor scheme's signature colors, in the order they show up in code.
local SWATCHES = { "keyword", "type", "func", "string", "number", "constant", "comment" }

-------------------------------------------------------------------------------
-- Banner
-------------------------------------------------------------------------------
local function banner()
  local W, H = 1280, 420
  local o = {}
  local function add(...)
    o[#o + 1] = fmt(...)
  end

  add('<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d">', W, H, W, H)
  add("<defs>")
  add('<clipPath id="left"><polygon points="0,0 %d,0 %d,%d 0,%d"/></clipPath>', W / 2 + 70, W / 2 - 70, H, H)
  add('<clipPath id="right"><polygon points="%d,0 %d,0 %d,%d %d,%d"/></clipPath>', W / 2 + 70, W, W, H, W / 2 - 70, H)
  add('<clipPath id="card"><rect width="%d" height="%d" rx="24"/></clipPath>', W, H)
  add("</defs>")
  add('<g clip-path="url(#card)">')
  add('<rect width="%d" height="%d" fill="%s"/>', W, H, L.bg)
  add('<rect width="%d" height="%d" fill="%s" clip-path="url(#right)"/>', W, H, D.bg)

  local function title(c, clip)
    add('<g clip-path="url(#%s)">', clip)
    -- "ppy" with the purple preprocessor block behind the last letter
    add(
      '<text x="%d" y="200" text-anchor="middle" font-family="%s" font-size="128" font-weight="700" letter-spacing="-2" fill="%s">ppy<tspan fill="%s">.nvim</tspan></text>',
      W / 2, FONT, c.code.keyword, c.code.semicolon
    )
    add(
      '<text x="%d" y="258" text-anchor="middle" font-family="%s" font-size="26" fill="%s" letter-spacing="0.5">a very ppy colour scheme, now for Neovim</text>',
      W / 2, SANS, c.ui.fg
    )
    add(
      '<text x="%d" y="372" text-anchor="middle" font-family="%s" font-size="17" fill="%s" letter-spacing="4">PORTED FROM PEPPY/PPY-JETBRAINS-THEME</text>',
      W / 2, FONT, c.muted
    )
    add("</g>")
  end
  title(L, "left")
  title(D, "right")

  -- swatches: each drawn in the variant it sits on
  local n, gap, r = #SWATCHES, 40, 10
  local x0 = W / 2 - (n - 1) * gap / 2
  for i, k in ipairs(SWATCHES) do
    local x = x0 + (i - 1) * gap
    local c = x < W / 2 and L or D
    add('<circle cx="%d" cy="310" r="%d" fill="%s"/>', x, r, c.code[k])
  end
  add("</g>")
  add("</svg>")
  return concat(o, "\n")
end

-------------------------------------------------------------------------------
-- Preview: the C# sample from the original screenshots, in both variants
-------------------------------------------------------------------------------
-- token = { text, style } where style names a `c.code` role, or
-- "todo" | "preproc" | "semi" | nil (plain fg)
local CODE = {
  { { "using", "keyword" }, { " System" }, { ";", "semi" } },
  {},
  { { "namespace", "keyword" }, { " osu.Game.Database", "variable" } },
  { { "{" } },
  { { "    " }, { "public class", "keyword" }, { " " }, { "ThisIsAnAwesomeClass", "type" } },
  { { "    {" } },
  { { "        " }, { "#region", "preproc" }, { " Variables", "variable" } },
  { { "        /// <summary>Default value for the field.</summary>", "doc" } },
  { { "        " }, { "private const bool", "keyword" }, { " " }, { "field_default_value", "constant" }, { " = " }, { "true", "keyword" }, { ";", "semi" } },
  { { "        " }, { "private readonly int", "keyword" }, { " " }, { "count", "variable" }, { " = " }, { "42", "number" }, { ";", "semi" } },
  { { "        " }, { "#endregion", "preproc" } },
  {},
  { { "        " }, { "public", "keyword" }, { " " }, { "ThisIsAnAwesomeClass", "type" }, { "()" } },
  { { "        {" } },
  { { "            // " }, { "TODO: figure out what this is for.", "todo" } },
  { { "            " }, { "throw new", "keyword" }, { " " }, { "InvalidOperationException", "type" }, { "(" }, { '$"', "string" }, { "{count}", "format" }, { ' used"', "string" }, { ")" }, { ";", "semi" } },
  { { "        }" } },
  {},
  { { "        " }, { "public bool", "keyword" }, { " " }, { "GetFieldValue", "func_decl" }, { "() => " }, { "IsSet", "func" }, { "()" }, { ";", "semi" } },
  { { "    }" } },
  { { "}" } },
}
local CURSOR = 16
-- line -> git kind (numhl, like `numhl = true` in gitsigns)
local GIT = { [9] = "change", [10] = "add", [19] = "add" }
-- line -> { col, len }: write reference of `count` (LspReferenceWrite)
local REFS = { [10] = { 29, 5 } }

local function editor(c, ox, oy, w, h, label)
  local o = {}
  local function add(...)
    o[#o + 1] = fmt(...)
  end
  local u, k = c.ui, c.code
  local fs, lh = 14, 22
  local cw = fs * 0.6
  local gutter = 46
  local top = oy + 44

  local id = "clip" .. label
  add('<clipPath id="%s"><rect x="%d" y="%d" width="%d" height="%d" rx="14"/></clipPath>', id, ox, oy, w, h)
  add('<g font-family="%s" font-size="%d" clip-path="url(#%s)">', FONT, fs, id)
  add('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', ox, oy, w, h, c.bg)

  -- tabline: JetBrains editor tabs with the purple underline
  add('<rect x="%d" y="%d" width="%d" height="34" fill="%s"/>', ox, oy, w, u.panel)
  add('<rect x="%d" y="%d" width="200" height="34" fill="%s"/>', ox + 14, oy, u.panel_sel)
  add('<rect x="%d" y="%d" width="200" height="3" fill="%s"/>', ox + 14, oy + 31, u.accent)
  add('<text x="%d" y="%d" fill="%s"><tspan fill="%s">#</tspan> AwesomeClass.cs</text>', ox + 26, oy + 22, u.fg, c.purple)
  add('<text x="%d" y="%d" fill="%s">Database.cs</text>', ox + 234, oy + 22, c.muted)
  add('<text x="%d" y="%d" fill="%s" font-family="%s" font-size="13" text-anchor="end" letter-spacing="2">%s</text>', ox + w - 16, oy + 22, c.muted, SANS, label)

  for i, line in ipairs(CODE) do
    local y = top + (i - 1) * lh
    local base = y + lh * 0.7
    if i == CURSOR then
      add('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', ox, y, w, lh, u.cursorline)
    end
    local r = REFS[i]
    if r then
      add('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', ox + gutter + r[1] * cw, y + 2, r[2] * cw, lh - 4, u.ref_write)
    end
    local g = GIT[i]
    if g then
      add('<rect x="%d" y="%d" width="3" height="%d" fill="%s"/>', ox + gutter - 8, y + 2, lh - 4, c.git[g])
    end
    local nr_fill = i == CURSOR and u.line_nr_cur or u.line_nr
    add('<text x="%d" y="%d" text-anchor="end" fill="%s">%d</text>', ox + gutter - 14, base, nr_fill, i)

    local col, parts = 0, {}
    for _, tok in ipairs(line) do
      local text, style = tok[1], tok[2]
      local x = ox + gutter + col * cw
      if style == "preproc" then
        add('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', x, y + 2, #text * cw, lh - 4, k.preproc_bg)
        parts[#parts + 1] = fmt('<tspan fill="%s">%s</tspan>', k.preproc_fg, esc(text))
      elseif style == "todo" then
        add('<rect x="%d" y="%d" width="%d" height="%d" fill="%s"/>', x, y + 2, #text * cw, lh - 4, u.todo_bg)
        parts[#parts + 1] = fmt('<tspan fill="%s" font-weight="700">%s</tspan>', u.todo_fg, esc(text))
      elseif style == "semi" then
        parts[#parts + 1] = fmt('<tspan fill="%s">%s</tspan>', k.semicolon, esc(text))
      elseif style == "doc" then
        parts[#parts + 1] = fmt('<tspan fill="%s" font-style="italic">%s</tspan>', k.doc, esc(text))
      elseif style then
        parts[#parts + 1] = fmt('<tspan fill="%s">%s</tspan>', k[style], esc(text))
      else
        parts[#parts + 1] = esc(text)
      end
      col = col + #text
    end
    add('<text x="%d" y="%d" fill="%s" xml:space="preserve">%s</text>', ox + gutter, base, c.fg, concat(parts))
  end

  -- wavy warning under `count` on the cursor line
  local ey = top + (CURSOR - 1) * lh
  local ex = ox + gutter + 51 * cw
  add('<path d="M%d %d q2 -3 4 0 t4 0 t4 0 t4 0 t4 0 t4 0 t4 0 t4 0 t4 0 t4 0" fill="none" stroke="%s" stroke-width="1.2"/>', ex, ey + lh - 2, c.diag.warn)

  -- statusline
  local sy = oy + h - 30
  add('<rect x="%d" y="%d" width="%d" height="30" fill="%s"/>', ox, sy, w, u.panel)
  add('<rect x="%d" y="%d" width="64" height="30" fill="%s"/>', ox, sy, u.accent)
  add('<text x="%d" y="%d" fill="#ffffff" font-weight="700">NOR</text>', ox + 18, sy + 20)
  add('<text x="%d" y="%d" fill="%s"><tspan fill="%s"> main</tspan>  <tspan fill="%s">+2</tspan> <tspan fill="%s">~1</tspan>  <tspan fill="%s">W:1</tspan></text>', ox + 78, sy + 20, u.fg, c.git.add, c.git.add, c.git.change, c.diag.warn)
  add('<text x="%d" y="%d" fill="%s" text-anchor="end">cs  16:24</text>', ox + w - 16, sy + 20, c.muted)
  add("</g>")
  add('<rect x="%d" y="%d" width="%d" height="%d" rx="14" fill="none" stroke="%s"/>', ox, oy, w, h, u.border)
  return concat(o, "\n")
end

local function preview()
  local W, H = 1280, 580
  local ew, eh = 620, 540
  return concat({
    fmt('<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d">', W, H, W, H),
    editor(L, 13, 20, ew, eh, "LIGHT"),
    editor(D, W - ew - 13, 20, ew, eh, "DARK"),
    "</svg>",
  }, "\n")
end

vim.fn.mkdir("assets", "p")
write("assets/banner.svg", banner())
write("assets/preview.svg", preview())
print("assets/banner.svg, assets/preview.svg written")
