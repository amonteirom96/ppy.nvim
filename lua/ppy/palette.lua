local util = require("ppy.util")

local M = {}

--- Base palettes, taken from Dean Herbert's ppy JetBrains theme:
---   code  <- colorSchemes/ppy {Dark,Light}.xml (the editor scheme)
---   ui    <- ppy {Dark,Light}.theme.json (JetBrains "Dark Purple" chrome)
--- Values are kept as-is so the editor looks like Rider with ppy.
---@type table<"light"|"dark", ppy.BasePalette>
M.base = {
  dark = {
    bg = "#20202a", -- TEXT background
    fg = "#abb2bf", -- TEXT foreground
    red = "#ff4e4e", -- ERRORS_ATTRIBUTES effect
    orange = "#e58f44", -- ReSharper.FORMAT_STRING_ITEM
    yellow = "#eda726", -- WARNING_ATTRIBUTES effect
    green = "#98c379", -- DEFAULT_FUNCTION_CALL
    cyan = "#4c9eca", -- MARKDOWN_HEADER
    azure = "#76a1ce", -- DEFAULT_STATIC_FIELD
    blue = "#61afef", -- DEFAULT_CLASS_NAME
    purple = "#d080fb", -- ReSharper.PREPROCESSOR_KEYWORD
    pink = "#fb7385", -- DEFAULT_KEYWORD
    magenta = "#ce95b8", -- DEFAULT_NUMBER

    ui = {
      fg = "#d0d0d9", -- theme `*.foreground`
      panel = "#2c2c3b", -- theme `*.background`, breadcrumbs, tearline
      panel_sel = "#343445", -- EditorTabs.selectedBackground
      header = "#453a5c", -- ToolWindow.Header.background
      list_sel = "#3a324a", -- lightSelectionBackground
      accent = "#904ac2", -- EditorTabs.underlineColor
      border = "#4e4b61", -- Popup.borderColor
      split = "#333344", -- INDENT_GUIDE
      muted = "#6d6a80", -- infoForeground
      cursorline = "#2f2f3f", -- CARET_ROW_COLOR
      selection = "#40375e", -- SELECTION_BACKGROUND
      line_nr = "#495162", -- LINE_NUMBERS_COLOR
      line_nr_cur = "#a4a3a3", -- Darcula LINE_NUMBER_ON_CARET_ROW_COLOR
      indent = "#333344", -- INDENT_GUIDE
      indent_active = "#455989", -- SELECTED_INDENT_GUIDE
      ref = "#404856", -- IDENTIFIER_UNDER_CARET_ATTRIBUTES
      ref_write = "#4b3c24", -- the brown "field" highlight in the screenshot
      match = "#564a56", -- MATCHED_BRACE_ATTRIBUTES
      search = "#624314", -- TEXT_SEARCH_RESULT_ATTRIBUTES
      cur_search = "#ffe792", -- SEARCH_RESULT_ATTRIBUTES
      fold_fg = "#ed88b2", -- FOLDED_TEXT_ATTRIBUTES
      fold_bg = "#2f333d",
      todo_fg = "#ff7d19", -- TODO_DEFAULT_ATTRIBUTES
      todo_bg = "#342727",
      error_bg = "#480a0a", -- ERRORS_ATTRIBUTES
      warn_bg = "#483a0a", -- WARNING_ATTRIBUTES
      lens_fg = "#999999", -- CODE_LENS_BORDER_COLOR
      lens_bg = "#20222f",
      heading_fg = "#4c9eca", -- MARKDOWN_HEADER_LEVEL_*
      heading_bg = "#1c3d4b",
      link = "#287bde", -- HYPERLINK_ATTRIBUTES
      hint = "#aeff00", -- ReSharper.HINT
      injected = "#282c36", -- INJECTED_LANGUAGE_FRAGMENT
    },

    code = {
      keyword = "#fb7385",
      type = "#61afef",
      interface = "#379aef",
      enum = "#269cef",
      func = "#98c379",
      func_decl = "#98c379",
      accessor = "#569cd6",
      variable = "#dcdcdc",
      parameter = "#dcdcdc",
      static = "#76a1ce",
      constant = "#d3dde4",
      string = "#e5bc66",
      format = "#e58f44",
      escape = "#ffc423",
      number = "#ce95b8",
      comment = "#5c6370",
      doc = "#5c6370",
      doc_tag = "#a3a3a3",
      doc_value = "#8994a7",
      doc_markup = "#dcdcdc",
      semicolon = "#505069",
      preproc_fg = "#12061d",
      preproc_bg = "#d080fb",
    },

    diff = { add = "#294436", change = "#385570", text = "#4a6b90", delete = "#503d41" },
  },

  light = {
    bg = "#ffffff",
    fg = "#383a3f",
    red = "#cc5450", -- $baseRed
    orange = "#c57d42", -- $baseOrange
    yellow = "#d7ab54", -- $baseYellow
    green = "#71983b", -- $baseGreen
    cyan = "#307878", -- $baseCyan
    azure = "#2978b9", -- $lighterBlue
    blue = "#376388", -- $baseBlue
    purple = "#904ac2",
    pink = "#fb7385", -- DEFAULT_KEYWORD
    magenta = "#a64270", -- $baseMagenta

    ui = {
      fg = "#232323", -- $defaultForeground
      panel = "#e4e4e4", -- $darkerBackground
      panel_sel = "#dbdbdb", -- $defaultBackground
      header = "#c0c0c0", -- $lighterBackground
      list_sel = "#e5deff",
      accent = "#904ac2",
      border = "#c0c0c0", -- $popupBorder
      split = "#d5d5db", -- INDENT_GUIDE
      muted = "#6d6d6d", -- $grey
      cursorline = "#f1f1f1", -- CARET_ROW_COLOR
      selection = "#e5deff", -- SELECTION_BACKGROUND
      line_nr = "#8d8f9a", -- LINE_NUMBERS_COLOR
      line_nr_cur = "#574356", -- LINE_NUMBER_ON_CARET_ROW_COLOR
      indent = "#d5d5db",
      indent_active = "#b5b5c3",
      ref = "#e5e8ee", -- IDENTIFIER_UNDER_CARET_ATTRIBUTES
      ref_write = "#f3dff3", -- WRITE_IDENTIFIER_UNDER_CARET_ATTRIBUTES, softened
      match = "#edbcff", -- MATCHED_BRACE_ATTRIBUTES
      search = "#ffe99b", -- TEXT_SEARCH_RESULT_ATTRIBUTES
      cur_search = "#f5858c", -- WRITE_SEARCH_RESULT_ATTRIBUTES
      fold_fg = "#ed88b2",
      fold_bg = "#e5e5e5",
      todo_fg = "#f8a37f",
      todo_bg = "#fcf3e7",
      error_bg = "#ffd6d6",
      warn_bg = "#fcf1d9",
      lens_fg = "#64646e",
      lens_bg = "#eaeaea",
      heading_fg = "#3b739b",
      heading_bg = "#d4ecff",
      link = "#287bde",
      hint = "#8cc400",
      injected = "#eef2ff",
    },

    code = {
      keyword = "#fb7385",
      type = "#61afef",
      interface = "#379aef",
      enum = "#269cef",
      func = "#98c379",
      func_decl = "#70e021",
      accessor = "#569cd6",
      variable = "#4f4f4f",
      parameter = "#23b5ff",
      static = "#76a1ce",
      constant = "#3b7b9b",
      string = "#e5bc66",
      format = "#e58f44",
      escape = "#ffc423",
      number = "#ce95b8",
      comment = "#939aa6",
      doc = "#5c6370",
      doc_tag = "#8e8e8e",
      doc_value = "#8994a7",
      doc_markup = "#3f3f3f",
      semicolon = "#bdbdca",
      preproc_fg = "#ffffff",
      preproc_bg = "#d080fb",
    },

    diff = { add = "#cefeff", change = "#daedff", text = "#85c3ff", delete = "#ffc4d0" },
  },
}

---@class ppy.BasePalette
---@field bg string
---@field fg string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field cyan string
---@field azure string
---@field blue string
---@field purple string
---@field pink string
---@field magenta string
---@field ui ppy.UiColors
---@field code ppy.CodeColors
---@field diff { add: string, change: string, text: string, delete: string }

---@class ppy.UiColors
---@field fg string
---@field panel string         statusline, tabline, breadcrumbs
---@field panel_sel string     active tab
---@field header string        focused headers (float titles, active statusline blocks)
---@field list_sel string      selected row in lists and menus
---@field accent string        the Dark Purple accent
---@field border string
---@field split string
---@field muted string
---@field cursorline string
---@field selection string
---@field line_nr string
---@field line_nr_cur string
---@field indent string
---@field indent_active string
---@field ref string
---@field ref_write string
---@field match string
---@field search string
---@field cur_search string
---@field fold_fg string
---@field fold_bg string
---@field todo_fg string
---@field todo_bg string
---@field error_bg string
---@field warn_bg string
---@field lens_fg string
---@field lens_bg string
---@field heading_fg string
---@field heading_bg string
---@field link string
---@field hint string
---@field injected string

--- Code roles, straight from the JetBrains editor scheme.
---@class ppy.CodeColors
---@field keyword string
---@field type string
---@field interface string
---@field enum string
---@field func string        calls
---@field func_decl string   declarations
---@field accessor string
---@field variable string
---@field parameter string
---@field static string
---@field constant string
---@field string string
---@field format string      format items / escapes
---@field escape string
---@field number string
---@field comment string
---@field doc string
---@field doc_tag string
---@field doc_value string
---@field doc_markup string
---@field semicolon string
---@field preproc_fg string
---@field preproc_bg string

---@class ppy.Colors: ppy.BasePalette
---@field variant "light"|"dark"
---@field none "NONE"
---@field bg_float string
---@field bg_dim string      background for inactive windows (dim_inactive)
---@field muted string       UI chrome (= ui.muted)
---@field border string      (= ui.border)
---@field accent string      single UI focal color (matches, prompts)
---@field git { add: string, change: string, delete: string }
---@field diag { error: string, warn: string, info: string, hint: string, ok: string }

--- Build the full, derived color table for a variant.
---@param variant "light"|"dark"
---@param opts ppy.Config
---@return ppy.Colors
function M.get(variant, opts)
  local c = vim.deepcopy(M.base[variant]) --[[@as ppy.Colors]]
  local is_light = variant == "light"

  c.variant = variant
  c.none = "NONE"

  c.bg_float = is_light and c.bg or util.blend(c.ui.panel, c.bg, 0.5)
  c.bg_dim = is_light and util.blend(c.fg, c.bg, 0.03) or util.darken(c.bg, 0.15)
  c.muted = c.ui.muted
  c.border = c.ui.border
  c.accent = is_light and c.ui.accent or c.purple

  c.git = { add = c.green, change = c.blue, delete = c.red }
  c.diag = { error = c.red, warn = c.yellow, info = c.blue, hint = c.ui.hint, ok = c.green }

  if opts.on_colors then
    opts.on_colors(c, variant)
  end
  return c
end

return M
