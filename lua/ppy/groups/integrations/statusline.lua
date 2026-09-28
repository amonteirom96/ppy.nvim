--- Groups for a hand-written statusline (`%#StModeNormal#`, `%#StGit#`, ...).
--- Colors come from the palette, so git and diagnostics match gitsigns and
--- the diagnostic signs without any `on_highlights`.
--- Each mode gets a filled block plus a `Sep` group for the powerline edge.
--- Normal mode uses the Dark Purple header, like a focused tool window.

---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local bg = c.ui.panel
  local hl = {
    StProject = { fg = c.accent, bg = bg },
    StGit = { fg = c.git.add, bg = bg },
    StGitAdd = { fg = c.git.add, bg = bg },
    StGitChange = { fg = c.git.change, bg = bg },
    StGitDelete = { fg = c.git.delete, bg = bg },
    StError = { fg = c.diag.error, bg = bg },
    StWarn = { fg = c.diag.warn, bg = bg },
    StInfo = { fg = c.diag.info, bg = bg },
    StHint = { fg = c.diag.hint, bg = bg },
    StLsp = { fg = c.accent, bg = bg },
  }

  local modes = {
    Normal = c.ui.accent,
    Insert = c.green,
    Visual = c.pink,
    Replace = c.orange,
    Command = c.yellow,
    Other = c.cyan,
  }
  for mode, color in pairs(modes) do
    local fg = mode == "Normal" and "#ffffff" or c.bg
    hl["StMode" .. mode] = { fg = fg, bg = color, bold = true }
    hl["StMode" .. mode .. "Sep"] = { fg = color, bg = bg }
  end

  return hl
end
