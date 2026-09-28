--- Treesitter captures. Most captures fall back to the legacy groups through
--- Neovim's default links, so we only set what the default colorscheme
--- hard-codes plus the captures where ppy differs (builtin types and booleans
--- are keywords, declarations vs calls, doc comments, markdown headers).

---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local s = o.styles
  local k = c.code
  local u = c.ui

  ---@param color string
  ---@param style ppy.Style
  local function with(color, style)
    return vim.tbl_extend("force", { fg = color }, style)
  end

  local keyword = with(k.keyword, s.keywords)
  local heading = { fg = u.heading_fg, bg = u.heading_bg, bold = true }

  return {
    ["@variable"] = with(k.variable, s.variables),
    ["@variable.builtin"] = keyword,
    ["@variable.parameter"] = with(k.parameter, s.variables),
    ["@variable.parameter.builtin"] = keyword,
    ["@variable.member"] = with(k.variable, s.variables),

    ["@constant"] = with(k.constant, s.constants),
    ["@constant.builtin"] = keyword,
    ["@constant.macro"] = with(k.constant, s.constants),
    ["@module"] = { fg = k.variable },
    ["@module.builtin"] = { fg = k.variable },
    ["@label"] = { fg = k.variable },

    ["@string"] = with(k.string, s.strings),
    ["@string.documentation"] = with(k.doc, s.comments),
    ["@string.regexp"] = with(k.string, s.strings),
    ["@string.escape"] = { fg = k.format },
    ["@string.special"] = { fg = k.format },
    ["@string.special.symbol"] = with(k.constant, s.constants),
    ["@string.special.url"] = { fg = u.link, underline = true },
    ["@string.special.path"] = { fg = k.string },
    ["@character"] = with(k.string, s.strings),
    ["@character.special"] = { fg = k.format },

    ["@boolean"] = keyword,
    ["@number"] = with(k.number, s.constants),
    ["@number.float"] = with(k.number, s.constants),

    ["@type"] = with(k.type, s.types),
    ["@type.builtin"] = keyword, -- `bool`, `int`, `string` are keywords in Rider
    ["@type.definition"] = with(k.type, s.types),
    ["@attribute"] = { fg = k.type },
    ["@attribute.builtin"] = { fg = k.type },
    ["@property"] = with(k.variable, s.variables),

    ["@function"] = with(k.func_decl, s.functions),
    ["@function.builtin"] = with(k.func, s.functions),
    ["@function.call"] = with(k.func, s.functions),
    ["@function.macro"] = { fg = k.preproc_fg, bg = k.preproc_bg },
    ["@function.method"] = with(k.func_decl, s.functions),
    ["@function.method.call"] = with(k.func, s.functions),
    ["@constructor"] = with(k.type, s.types),
    ["@operator"] = with(c.fg, s.operators),

    ["@keyword"] = keyword,
    ["@keyword.coroutine"] = keyword,
    ["@keyword.function"] = keyword,
    ["@keyword.operator"] = keyword,
    ["@keyword.import"] = keyword,
    ["@keyword.type"] = keyword,
    ["@keyword.modifier"] = keyword,
    ["@keyword.repeat"] = keyword,
    ["@keyword.return"] = keyword,
    ["@keyword.exception"] = keyword,
    ["@keyword.conditional"] = keyword,
    ["@keyword.directive"] = { fg = k.preproc_fg, bg = k.preproc_bg },
    ["@keyword.directive.define"] = { fg = k.preproc_fg, bg = k.preproc_bg },

    ["@punctuation"] = { fg = c.fg },
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.delimiter.semicolon"] = { fg = o.dim_semicolons and k.semicolon or c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = k.format },
    ["@tag"] = { fg = k.keyword },
    ["@tag.builtin"] = { fg = k.keyword },
    ["@tag.attribute"] = { fg = k.variable },
    ["@tag.delimiter"] = { fg = k.semicolon },

    ["@comment"] = with(k.comment, s.comments),
    ["@comment.documentation"] = with(k.doc, s.comments),

    -- Comment markers: the orange bold TODO block from Rider.
    ["@comment.error"] = { fg = c.red, bg = u.error_bg, bold = true },
    ["@comment.warning"] = { fg = c.yellow, bg = u.warn_bg, bold = true },
    ["@comment.todo"] = { fg = u.todo_fg, bg = u.todo_bg, bold = true },
    ["@comment.note"] = { fg = u.heading_fg, bg = u.heading_bg, bold = true },

    -- Markup (Markdown is one of the theme's focus areas)
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = heading,
    ["@markup.heading.1"] = heading,
    ["@markup.heading.2"] = heading,
    ["@markup.heading.3"] = heading,
    ["@markup.heading.4"] = { fg = u.heading_fg, bold = true },
    ["@markup.heading.5"] = { fg = u.heading_fg, bold = true },
    ["@markup.heading.6"] = { fg = u.heading_fg, bold = true },
    ["@markup.heading.1.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.heading.2.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.quote"] = { fg = k.comment, italic = true },
    ["@markup.math"] = { fg = k.number },
    ["@markup.link"] = { fg = u.link },
    ["@markup.link.label"] = { fg = k.type },
    ["@markup.link.url"] = { fg = u.link, underline = true },
    ["@markup.raw"] = { fg = k.string, bg = u.injected },
    ["@markup.raw.block"] = { fg = c.fg },
    ["@markup.list"] = { fg = k.keyword },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.muted },

    ["@diff.plus"] = { fg = c.git.add },
    ["@diff.minus"] = { fg = c.git.delete },
    ["@diff.delta"] = { fg = c.git.change },
  }
end
