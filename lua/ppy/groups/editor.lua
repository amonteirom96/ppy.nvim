local util = require("ppy.util")

---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local blend = util.blend
  local u = c.ui
  local bg = o.transparent and c.none or c.bg
  local float_bg = o.transparent and c.none or (o.float.solid and u.panel or c.bg_float)
  local float_border = o.float.solid and { fg = u.panel, bg = float_bg } or { fg = u.border, bg = float_bg }

  local hl = {
    -- Base -------------------------------------------------------------------
    Normal = { fg = c.fg, bg = bg },
    NormalNC = { fg = c.fg, bg = (o.dim_inactive and not o.transparent) and c.bg_dim or bg },
    NormalFloat = { fg = c.fg, bg = float_bg },
    FloatBorder = float_border,
    FloatTitle = { fg = u.fg, bg = u.header, bold = true },
    FloatFooter = { fg = c.muted, bg = float_bg },
    FloatShadow = { bg = "#000000", blend = 80 },
    FloatShadowThrough = { bg = "#000000", blend = 100 },
    MsgArea = { fg = c.fg },
    MsgSeparator = { fg = u.split, bg = bg },
    ModeMsg = { fg = u.fg, bold = true },
    MoreMsg = { fg = c.accent, bold = true },
    Question = { fg = c.accent },
    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.yellow },
    OkMsg = { fg = c.green },
    StderrMsg = { fg = c.red },
    StdoutMsg = { fg = c.fg },
    NvimInternalError = { fg = c.bg, bg = c.red },
    Title = { fg = u.fg, bold = true },
    Directory = { fg = c.blue },
    Conceal = { fg = c.muted },
    NonText = { fg = u.indent },
    EndOfBuffer = { fg = c.bg },
    Whitespace = { fg = u.indent },
    SpecialKey = { fg = c.muted },

    -- Cursor & lines ---------------------------------------------------------
    Cursor = { fg = c.bg, bg = c.fg },
    lCursor = { fg = c.bg, bg = c.fg },
    CursorIM = { fg = c.bg, bg = c.fg },
    TermCursor = { reverse = true },
    CursorLine = { bg = u.cursorline },
    CursorColumn = { bg = u.cursorline },
    ColorColumn = { bg = u.cursorline },
    LineNr = { fg = u.line_nr },
    LineNrAbove = { fg = u.line_nr },
    LineNrBelow = { fg = u.line_nr },
    CursorLineNr = { fg = u.line_nr_cur, bg = u.cursorline },
    CursorLineSign = { bg = u.cursorline },
    CursorLineFold = { fg = c.muted, bg = u.cursorline },
    SignColumn = { fg = u.line_nr, bg = bg },
    FoldColumn = { fg = u.line_nr, bg = bg },
    Folded = { fg = u.fold_fg, bg = u.fold_bg },
    QuickFixLine = { bg = u.list_sel, bold = true },

    -- Selection & search -----------------------------------------------------
    Visual = { bg = u.selection },
    VisualNOS = { bg = u.selection },
    Search = { bg = u.search },
    CurSearch = { fg = "#000000", bg = u.cur_search },
    IncSearch = { fg = "#000000", bg = u.cur_search },
    Substitute = { fg = "#000000", bg = u.cur_search, bold = true },
    MatchParen = { bg = u.match, bold = true },

    -- Windows, bars ----------------------------------------------------------
    WinSeparator = { fg = u.split, bg = bg },
    VertSplit = { fg = u.split, bg = bg },
    StatusLine = { fg = u.fg, bg = u.panel },
    StatusLineNC = { fg = c.muted, bg = u.panel },
    StatusLineTerm = { fg = u.fg, bg = u.panel },
    StatusLineTermNC = { fg = c.muted, bg = u.panel },
    TabLine = { fg = c.muted, bg = u.panel },
    TabLineFill = { bg = u.panel },
    TabLineSel = { fg = u.fg, bg = u.panel_sel, sp = u.accent, underline = true },
    WinBar = { fg = c.fg, bg = bg },
    WinBarNC = { fg = c.muted, bg = bg },
    WildMenu = { fg = u.fg, bg = u.list_sel, bold = true },

    -- Popup menu -------------------------------------------------------------
    Pmenu = { fg = c.fg, bg = float_bg },
    PmenuSel = { bg = u.list_sel },
    PmenuKind = { fg = c.muted, bg = float_bg },
    PmenuKindSel = { fg = u.fg, bg = u.list_sel },
    PmenuExtra = { fg = c.muted, bg = float_bg },
    PmenuExtraSel = { fg = c.muted, bg = u.list_sel },
    PmenuMatch = { fg = c.accent, bold = true },
    PmenuMatchSel = { fg = c.accent, bg = u.list_sel, bold = true },
    PmenuSbar = { bg = float_bg },
    PmenuThumb = { bg = u.border },
    PmenuBorder = float_border,
    PmenuShadow = { bg = "#000000", blend = 80 },
    PmenuShadowThrough = { bg = "#000000", blend = 100 },
    ComplMatchIns = { fg = c.muted },
    ComplHint = { fg = c.muted },
    ComplHintMore = { fg = c.muted },

    -- Snippets ---------------------------------------------------------------
    SnippetTabstop = { bg = u.ref },
    SnippetTabstopActive = { bg = u.selection, bold = true },

    -- Spell ------------------------------------------------------------------
    SpellBad = { sp = c.red, undercurl = true },
    SpellCap = { sp = c.yellow, undercurl = true },
    SpellLocal = { sp = u.hint, underdotted = true },
    SpellRare = { sp = c.purple, undercurl = true },

    -- Diff & git -------------------------------------------------------------
    Added = { fg = c.git.add },
    Changed = { fg = c.git.change },
    Removed = { fg = c.git.delete },
    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { fg = c.git.delete, bg = c.diff.delete },
    DiffText = { bg = c.diff.text },
    DiffTextAdd = { bg = blend(c.git.add, c.diff.add, 0.3) },
    diffAdded = { fg = c.git.add },
    diffChanged = { fg = c.git.change },
    diffRemoved = { fg = c.git.delete },
    diffFile = { fg = u.fg, bold = true },
    diffLine = { fg = c.purple },
    diffIndexLine = { fg = c.muted },

    -- Diagnostics ------------------------------------------------------------
    -- Unused symbols fade out, like Rider's "UnusedVariable".
    DiagnosticDeprecated = { sp = c.muted, strikethrough = true },
    DiagnosticUnnecessary = { fg = c.code.comment },

    -- LSP --------------------------------------------------------------------
    LspReferenceText = { bg = u.ref },
    LspReferenceRead = { bg = u.ref },
    LspReferenceWrite = { bg = u.ref_write },
    LspReferenceTarget = { bg = u.ref },
    LspInlayHint = { fg = u.lens_fg, bg = u.lens_bg, italic = true },
    LspCodeLens = { fg = u.lens_fg, italic = true },
    LspCodeLensSeparator = { fg = u.split },
    LspSignatureActiveParameter = { bg = u.ref, bold = true },
    LspInfoBorder = float_border,

    -- Health -----------------------------------------------------------------
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.yellow },

    -- Redraw debug -----------------------------------------------------------
    RedrawDebugNormal = { reverse = true },
    RedrawDebugClear = { bg = c.yellow },
    RedrawDebugComposed = { bg = c.green },
    RedrawDebugRecompose = { bg = c.red },
  }

  -- Rider paints errors and warnings with a wave underline on a tinted
  -- background, and hints with a dotted line in lime.
  local tints = {
    Error = u.error_bg,
    Warn = u.warn_bg,
    Info = blend(c.diag.info, c.bg, 0.12),
    Hint = blend(c.diag.hint, c.bg, 0.08),
    Ok = blend(c.diag.ok, c.bg, 0.10),
  }
  for name, color in pairs({ Error = c.diag.error, Warn = c.diag.warn, Info = c.diag.info, Hint = c.diag.hint, Ok = c.diag.ok }) do
    local tint = tints[name]
    hl["Diagnostic" .. name] = { fg = color }
    hl["DiagnosticSign" .. name] = { fg = color, bg = bg }
    hl["DiagnosticFloating" .. name] = { fg = color }
    hl["DiagnosticVirtualText" .. name] = { fg = color, bg = tint }
    hl["DiagnosticVirtualLines" .. name] = { fg = color }
    hl["DiagnosticLine" .. name] = { bg = tint }
    if name == "Hint" then
      hl["DiagnosticUnderline" .. name] = { sp = color, underdotted = true }
    else
      hl["DiagnosticUnderline" .. name] = { sp = color, undercurl = true }
    end
  end

  return hl
end
