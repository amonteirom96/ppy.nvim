local M = {}
local colors = require('ppy.colors').colors

-- Função para definir as cores
function M.set_colors()
    local c = vim.o.background == 'light' and colors.light or colors.dark

    local groups = {
        -- Editor UI
        Normal = { fg = c.fg, bg = c.bg },
        NormalFloat = { fg = c.fg, bg = c.bg },
        Cursor = { fg = c.bg, bg = c.cursor },
        CursorLine = { bg = c.cursor_line_bg },
        CursorLineNr = { fg = c.line_nr_cursor, bg = c.cursor_line_bg },
        LineNr = { fg = c.line_nr, bg = c.bg },
        SignColumn = { bg = c.bg },
        ColorColumn = { bg = c.bg_alt },
        VertSplit = { fg = c.border },
        Visual = { bg = c.visual_bg },
        VisualNOS = { bg = c.visual_bg },
        IncSearch = { fg = c.bg, bg = c.keyword },
        Search = { fg = c.bg, bg = c.keyword },
        
        -- Syntax
        Comment = { fg = c.comment, italic = true },
        Constant = { fg = c.constant },
        String = { fg = c.string },
        Character = { fg = c.string },
        Number = { fg = c.number },
        Boolean = { fg = c.keyword },
        Float = { fg = c.number },
        Identifier = { fg = c.fg },
        Function = { fg = c.function_name },
        Statement = { fg = c.keyword },
        Conditional = { fg = c.keyword },
        Repeat = { fg = c.keyword },
        Label = { fg = c.keyword },
        Operator = { fg = c.fg },
        Keyword = { fg = c.keyword },
        Exception = { fg = c.keyword },
        PreProc = { fg = c.keyword },
        Include = { fg = c.keyword },
        Define = { fg = c.keyword },
        Macro = { fg = c.keyword },
        Type = { fg = c.type },
        StorageClass = { fg = c.keyword },
        Structure = { fg = c.type },
        Typedef = { fg = c.type },
        Special = { fg = c.keyword },
        SpecialChar = { fg = c.string },
        Tag = { fg = c.keyword },
        Delimiter = { fg = c.fg },
        SpecialComment = { fg = c.comment, italic = true },
        Debug = { fg = c.keyword },
        
        -- Messages
        Error = { fg = c.error },
        ErrorMsg = { fg = c.error },
        WarningMsg = { fg = c.warning },
        InfoMsg = { fg = c.info },
        HintMsg = { fg = c.hint },
        
        -- Diagnostics
        DiagnosticError = { fg = c.error },
        DiagnosticWarn = { fg = c.warning },
        DiagnosticInfo = { fg = c.info },
        DiagnosticHint = { fg = c.hint },
        
        -- Popup menu
        Pmenu = { fg = c.pmenu_fg, bg = c.pmenu_bg },
        PmenuSel = { fg = c.pmenu_fg, bg = c.pmenu_select },
        PmenuSbar = { bg = c.pmenu_bg },
        PmenuThumb = { bg = c.pmenu_select },
        
        -- Diff
        DiffAdd = { bg = c.diff_add },
        DiffChange = { bg = c.diff_text },
        DiffDelete = { bg = c.diff_delete },
        DiffText = { bg = c.diff_text },
        
        -- Statusline
        StatusLine = { fg = c.statusline_fg, bg = c.statusline_bg },
        StatusLineNC = { fg = c.statusline_fg, bg = c.statusline_bg },
        
        -- Indentation
        IndentBlanklineChar = { fg = c.indent_guide },
    }

    -- Aplicar grupos de destaque
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

-- Função para carregar o tema
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "ppy"

    M.set_colors()

    -- Configurar autocmd para atualizar cores quando mudar entre light/dark
    vim.api.nvim_create_autocmd("OptionSet", {
        pattern = "background",
        callback = function()
            M.set_colors()
        end,
    })
end

return M
