-- Definição das cores baseadas diretamente no XML do tema ppy
local M = {}

M.colors = {
    dark = {
        bg = "#20202A",
        bg_alt = "#2F2F3F",
        fg = "#ABB2BF",
        cursor = "#DEDEDE",
        cursor_line_bg = "#2F2F3F",
        selection_bg = "#40375E",
        comment = "#5C6370",
        keyword = "#FB7385",
        string = "#E5BC66",
        number = "#CE95B8",
        function_name = "#98C379",
        constant = "#D3DDE4",
        type = "#61AFEF",
        interface = "#379AEF",
        line_nr = "#495162",
        line_nr_cursor = "#DEDEDE",
        error = { fg = "#FF4E4E", bg = "#3F1F1F" },
        warning = { fg = "#EDA726", bg = "#3F2F1F" },
        info = { fg = "#287BDE", bg = "#1F2F3F" },
        hint = { fg = "#98C379", bg = "#1F3F1F" },
        diff_add = "#30492E",
        diff_delete = "#503D41",
        diff_text = "#2C2C3B",
        border = "#2C2C3B",
        indent_guide = "#333344",
        statusline_bg = "#2C2C3B",
        statusline_fg = "#BBBBBB",
        pmenu_bg = "#2C2C3B",
        pmenu_fg = "#ABB2BF",
        pmenu_select = "#40375E",
        visual_bg = "#40375E",
    },
    light = {
        bg = "#FFFFFF",
        bg_alt = "#F1F1F1",
        fg = "#2B2B2B",  -- Escurecido para melhor contraste
        cursor = "#6A6A6A",
        cursor_line_bg = "#F1F1F1",
        selection_bg = "#D6D1F5",  -- Ligeiramente escurecido para melhor visibilidade
        comment = "#707A8C",  -- Escurecido para melhor legibilidade
        keyword = "#D3277E",  -- Ajustado para um tom mais escuro de rosa
        string = "#067D17",  -- Verde mais escuro para strings
        number = "#871094",  -- Roxo mais escuro para números
        function_name = "#00627A",  -- Azul mais escuro para funções
        constant = "#3B7B9B",
        type = "#0033B3",  -- Azul mais escuro para tipos
        interface = "#0057B3",  -- Azul mais escuro para interfaces
        line_nr = "#8D8F9A",
        line_nr_cursor = "#574356",
        error = { fg = "#FF0000", bg = "#FFE0E0" },
        warning = { fg = "#CF6A00", bg = "#FFF0E0" },
        info = { fg = "#0068D6", bg = "#E0F0FF" },
        hint = { fg = "#067D17", bg = "#E0FFE0" },
        diff_add = "#BFFFCF",
        diff_delete = "#FFD0D0",
        diff_text = "#FFEBCC",
        border = "#D5D5DB",
        indent_guide = "#D5D5DB",
        statusline_bg = "#E3E3E3",
        statusline_fg = "#2B2B2B",  -- Escurecido para melhor contraste
        pmenu_bg = "#F2F2F2",
        pmenu_fg = "#2B2B2B",  -- Escurecido para melhor contraste
        pmenu_select = "#D6D1F5",  -- Ligeiramente escurecido para melhor visibilidade
        visual_bg = "#D6D1F5",  -- Ligeiramente escurecido para melhor visibilidade
    }
}

return M

