--- LSP semantic tokens. These carry the distinctions Rider makes that
--- treesitter can't: interfaces, enums, static members, accessors, constants.

---@param c ppy.Colors
---@param o ppy.Config
return function(c, o)
  local s = o.styles
  local k = c.code

  ---@param color string
  ---@param style ppy.Style
  local function with(color, style)
    return vim.tbl_extend("force", { fg = color }, style)
  end

  return {
    ["@lsp.type.comment"] = {}, -- let treesitter keep TODO/FIXME markers
    ["@lsp.type.interface"] = with(k.interface, s.types),
    ["@lsp.type.enum"] = with(k.enum, s.types),
    ["@lsp.type.enumMember"] = with(k.static, s.constants),
    ["@lsp.type.typeParameter"] = with(k.type, s.types),
    ["@lsp.type.namespace"] = { fg = k.variable },
    ["@lsp.type.parameter"] = with(k.parameter, s.variables),
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.unresolvedReference"] = { sp = c.diag.error, undercurl = true },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.readonly"] = with(k.constant, s.constants),
    ["@lsp.typemod.variable.static"] = with(k.static, s.variables),
    ["@lsp.typemod.property.static"] = with(k.static, s.variables),
    ["@lsp.typemod.method.static"] = with(k.func, s.functions),
    ["@lsp.typemod.function.declaration"] = with(k.func_decl, s.functions),
    ["@lsp.typemod.method.declaration"] = with(k.func_decl, s.functions),
    ["@lsp.typemod.keyword.accessor"] = with(k.accessor, s.keywords),
  }
end
