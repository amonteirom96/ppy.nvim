local M = {}

-- Definição das cores
M.colors = {
    light = {
        bg = "#FFFFFF",
        fg = "#000000",
        accent = "#FF66AA",
        string = "#067D17",
        keyword = "#0033B3",
        function_name = "#00627A",
        constant = "#871094",
        number = "#1750EB",
        operator = "#000000",
        comment = "#8C8C8C",
        type = "#000080",
        variable = "#000000",
        error = "#FF0000",
        warning = "#FFA500",
        info = "#00FFFF",
        hint = "#008000",
        line_number = "#999999",
        line_number_cursor = "#000000",
        cursor_line_bg = "#FFFAE3",
        selection_bg = "#C2E8FF",
        pmenu_bg = "#F2F2F2",
        pmenu_fg = "#000000",
        pmenu_select_bg = "#C2E8FF",
        visual_bg = "#C2E8FF",
    },
    dark = {
        bg = "#1E1E1E",
        fg = "#CCCCCC",
        accent = "#FF66AA",
        string = "#6A8759",
        keyword = "#CC7832",
        function_name = "#FFC66D",
        constant = "#9876AA",
        number = "#6897BB",
        operator = "#CCCCCC",
        comment = "#808080",
        type = "#A9B7C6",
        variable = "#CCCCCC",
        error = "#FF0000",
        warning = "#FFA500",
        info = "#00FFFF",
        hint = "#008000",
        line_number = "#606366",
        line_number_cursor = "#CCCCCC",
        cursor_line_bg = "#323232",
        selection_bg = "#214283",
        pmenu_bg = "#3C3F41",
        pmenu_fg = "#CCCCCC",
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
    vim.api.nvim_set_hl(0, "Function", { fg = colors.function_name })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
    vim.api.nvim_set_hl(0, "Identifier", { fg = colors.variable })
    vim.api.nvim_set_hl(0, "Operator", { fg = colors.operator })

    -- Popup menu
    vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.pmenu_fg, bg = colors.pmenu_bg })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.pmenu_fg, bg = colors.pmenu_select_bg })

    -- Diagnostic
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.hint })

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


