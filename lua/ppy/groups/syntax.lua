--- Legacy syntax groups, mapped from the ppy JetBrains editor scheme:
--- pink keywords, blue types, green functions, yellow strings, magenta
--- numbers, grey italic comments, faded semicolons and the purple
--- preprocessor block.

---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local s = o.styles
  local k = c.code

  ---@param fg string
  ---@param style ppy.Style
  local function with(fg, style)
    return vim.tbl_extend("force", { fg = fg }, style)
  end

  local comment = with(k.comment, s.comments)
  local keyword = with(k.keyword, s.keywords)
  local func = with(k.func, s.functions)
  local variable = with(k.variable, s.variables)
  local str = with(k.string, s.strings)
  local typ = with(k.type, s.types)
  local num = with(k.number, s.constants)
  local const = with(k.constant, s.constants)
  local op = with(c.fg, s.operators)
  local preproc = { fg = k.preproc_fg, bg = k.preproc_bg }

  return {
    Comment = comment,
    SpecialComment = with(k.doc, s.comments),

    Constant = const,
    String = str,
    Character = str,
    Number = num,
    Boolean = keyword,
    Float = num,

    Identifier = variable,
    Function = func,

    Statement = keyword,
    Conditional = keyword,
    Repeat = keyword,
    Label = keyword,
    Keyword = keyword,
    Exception = keyword,
    Operator = op,

    PreProc = preproc,
    Include = keyword,
    Define = preproc,
    Macro = preproc,
    PreCondit = preproc,

    Type = typ,
    StorageClass = keyword,
    Structure = typ,
    Typedef = typ,

    Special = { fg = k.format },
    SpecialChar = { fg = k.format },
    Tag = { fg = k.type },
    Delimiter = { fg = c.fg },
    Debug = { fg = k.format },

    Underlined = { fg = c.ui.link, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.muted },
    Error = { fg = c.red, bg = c.ui.error_bg },
    Todo = { fg = c.ui.todo_fg, bg = c.ui.todo_bg, bold = true },
  }
end
