---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local hl = {
    DropBarCurrentContext = { bg = c.ui.list_sel },
    DropBarCurrentContextIcon = { bg = c.ui.list_sel },
    DropBarCurrentContextName = { fg = c.fg, bg = c.ui.list_sel, bold = true },
    DropBarHover = { bg = c.ui.list_sel },
    DropBarIconHover = { bg = c.ui.list_sel },
    DropBarIconUIIndicator = { fg = c.muted },
    DropBarIconUIPickPivot = { fg = c.accent, bold = true },
    DropBarIconUISeparator = { fg = c.muted },
    DropBarIconUISeparatorMenu = { fg = c.muted },
    DropBarMenuCurrentContext = { bg = c.ui.list_sel },
    DropBarMenuHoverEntry = { bg = c.ui.list_sel },
    DropBarMenuHoverIcon = { bg = c.ui.selection },
    DropBarMenuHoverSymbol = { bold = true },
    DropBarMenuNormalFloat = { link = "NormalFloat" },
    DropBarMenuFloatBorder = { link = "FloatBorder" },
    DropBarMenuSbar = { link = "PmenuSbar" },
    DropBarMenuThumb = { link = "PmenuThumb" },
    DropBarFzfMatch = { fg = c.accent, bold = true },
    DropBarPreview = { bg = c.ui.list_sel },
    DropBarKindDir = { fg = c.fg },
    DropBarKindFile = { fg = c.fg, bold = true },
    DropBarIconKindFolder = { fg = c.blue },
    DropBarIconKindTerminal = { fg = c.green },
    DropBarKindTerminal = { fg = c.fg },
  }

  -- Kind icons colored exactly like the completion menu. Names stay monochrome.
  for kind, key in pairs(require("ppy.kinds")) do
    hl["DropBarIconKind" .. kind] = { fg = c[key] }
  end

  -- Icons for dropbar's treesitter-only kinds
  for kind, key in pairs({
    Call = "green",
    Declaration = "green",
    Element = "azure",
    Identifier = "fg",
    List = "magenta",
    MarkdownH1 = "fg",
    Pair = "azure",
    Scope = "purple",
    Section = "fg",
    Specifier = "pink",
    Statement = "pink",
    Table = "blue",
    Type = "blue",
    Macro = "purple",
    Repeat = "pink",
    IfStatement = "pink",
    ElseStatement = "pink",
    ForStatement = "pink",
    WhileStatement = "pink",
    DoStatement = "pink",
    SwitchStatement = "pink",
    CaseStatement = "pink",
    BreakStatement = "pink",
    ContinueStatement = "pink",
    GotoStatement = "pink",
    ReturnStatement = "pink",
    Delete = "red",
    Rule = "pink",
    RuleSet = "pink",
    BlockMappingPair = "azure",
    Unit = "magenta",
  }) do
    hl["DropBarIconKind" .. kind] = { fg = c[key] }
  end

  return hl
end
