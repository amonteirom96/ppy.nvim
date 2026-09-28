--- mini.icons, mini.pick, mini.extra, mini.files, mini.tabline
---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local util = require("ppy.util")
  local float_bg = o.transparent and c.none or (o.float.solid and c.ui.panel or c.bg_float)

  return {
    -- mini.icons: icons keep their real colors.
    MiniIconsAzure = { fg = c.azure },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.muted },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },

    -- mini.pick / mini.extra
    MiniPickNormal = { fg = c.fg, bg = float_bg },
    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { fg = c.accent, bg = float_bg },
    MiniPickBorderText = { fg = c.fg, bg = float_bg, bold = true },
    MiniPickCursor = { blend = 100, nocombine = true },
    MiniPickHeader = { fg = c.fg, bold = true },
    MiniPickIconDirectory = { fg = c.fg },
    MiniPickIconFile = { fg = c.fg },
    MiniPickMatchCurrent = { bg = c.ui.list_sel, bold = true },
    MiniPickMatchMarked = { bg = util.blend(c.accent, c.bg, 0.18) },
    MiniPickMatchRanges = { fg = c.accent, bold = true },
    MiniPickPreviewLine = { bg = c.ui.list_sel },
    MiniPickPreviewRegion = { bg = c.ui.selection },
    MiniPickPrompt = { fg = c.fg, bg = float_bg },
    MiniPickPromptCaret = { fg = c.accent, bg = float_bg },
    MiniPickPromptPrefix = { fg = c.accent, bg = float_bg, bold = true },
    MiniExtraPickers = { fg = c.fg },

    -- mini.files
    MiniFilesNormal = { fg = c.fg, bg = float_bg },
    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { fg = c.git.change, bg = float_bg },
    MiniFilesCursorLine = { bg = c.ui.list_sel },
    MiniFilesDirectory = { fg = c.fg, bold = true },
    MiniFilesFile = { fg = c.fg },
    MiniFilesTitle = { fg = c.muted, bg = float_bg },
    MiniFilesTitleFocused = { fg = c.fg, bg = float_bg, bold = true },

    -- mini.tabline: JetBrains editor tabs (purple underline on the active one),
    -- modified buffers in the git "change" color.
    MiniTablineCurrent = { fg = c.ui.fg, bg = c.ui.panel_sel, sp = c.ui.accent, underline = true },
    MiniTablineVisible = { fg = c.fg, bg = c.ui.panel },
    MiniTablineHidden = { fg = c.muted, bg = c.ui.panel },
    MiniTablineModifiedCurrent = { fg = c.git.change, bg = c.ui.panel_sel, sp = c.ui.accent, underline = true },
    MiniTablineModifiedVisible = { fg = c.git.change, bg = c.ui.panel },
    MiniTablineModifiedHidden = { fg = util.blend(c.git.change, c.ui.panel, 0.7), bg = c.ui.panel },
    MiniTablineFill = { bg = c.ui.panel },
    MiniTablineTabpagesection = { fg = c.ui.fg, bg = c.ui.header, bold = true },
    MiniTablineTrunc = { fg = c.muted, bg = c.ui.panel },
  }
end
