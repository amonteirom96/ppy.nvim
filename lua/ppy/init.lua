local M = {}

-- Definição das cores
M.colors = {
    light = {
        bg = "#FFFFFF",
        fg = "#2B2B2B",
        accent = "#FF015B",
        string = "#067D17",
        keyword = "#0033B3",
        function_name = "#00627A",
        constant = "#871094",
        number = "#1750EB",
        operator = "#2B2B2B",
        comment = "#8C8C8C",
        type = "#000080",
        variable = "#2B2B2B",
        error = "#FF0000",
        warning = "#FF8C00",
        info = "#00B5FF",
        hint = "#008000",
        line_number = "#B3B3B3",
        line_number_cursor = "#2B2B2B",
        cursor_line_bg = "#FFFAE3",
        selection_bg = "#A6D2FF",
        pmenu_bg = "#F2F2F2",
        pmenu_fg = "#2B2B2B",
        pmenu_select_bg = "#A6D2FF",
        visual_bg = "#A6D2FF",
    },
    dark = {
        bg = "#2B2B2B",
        fg = "#A9B7C6",
        accent = "#FF015B",
        string = "#6A8759",
        keyword = "#CC7832",
        function_name = "#FFC66D",
        constant = "#9876AA",
        number = "#6897BB",
        operator = "#A9B7C6",
        comment = "#808080",
        type = "#A9B7C6",
        variable = "#A9B7C6",
        error = "#FF0000",
        warning = "#FF8C00",
        info = "#00B5FF",
        hint = "#008000",
        line_number = "#606366",
        line_number_cursor = "#A9B7C6",
        cursor_line_bg = "#323232",
        selection_bg = "#214283",
        pmenu_bg = "#3C3F41",
        pmenu_fg = "#A9B7C6",
        pmenu_select_bg = "#214283",
        visual_bg = "#214283",
    }
}

-- Função para definir as cores
function M.set_colors()
    local colors = vim.o.background == 'light' and M.colors.light or M.colors.dark

    -- Editor
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg })
    vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.cursor_line_bg })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.line_number, bg = colors.bg })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.line_number_cursor, bg = colors.cursor_line_bg })
    vim.api.nvim_set_hl(0, "Visual", { bg = colors.visual_bg })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.bg, bg = colors.accent })
    vim.api.nvim_set_hl(0, "Search", { fg = colors.bg, bg = colors.accent })

    -- Syntax
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
    vim.api.nvim_set_hl(0, "String", { fg = colors.string })
    vim.api.nvim_set_hl(0, "Number", { fg = colors.number })
    vim.api.nvim_set_hl(0, "Float", { fg = colors.number })
    vim.api.nvim_set_hl(0, "Boolean", { fg = colors.keyword })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.function_name })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.variable })
    vim.api.nvim_set_hl(0, "Operator", { fg = colors.operator })
    vim.api.nvim_set_hl(0, "Special", { fg = colors.keyword })
    vim.api.nvim_set_hl(0, "Statement", { fg = colors.keyword })
    vim.api.nvim_set_hl(0, "PreProc", { fg = colors.keyword })

    -- Popup menu
    vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.pmenu_fg, bg = colors.pmenu_bg })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.pmenu_fg, bg = colors.pmenu_select_bg })

    -- Diagnostic
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.hint })

    -- Diff
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.string, bold = true })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.constant, bold = true })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.error, bold = true })
    vim.api.nvim_set_hl(0, "DiffText", { fg = colors.fg, bold = true })

    -- Adicione mais grupos de destaque conforme necessário
end

-- Função para carregar o tema
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "ppy"

    M.set_colors()
end

return M
