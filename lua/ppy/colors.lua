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
        error = "#FF4E4E",
        warning = "#EDA726",
        info = "#287BDE",
        hint = "#98C379",
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
        fg = "#383A3F",
        cursor = "#6A6A6A",
        cursor_line_bg = "#F1F1F1",
        selection_bg = "#E5DEFF",
        comment = "#939AA6",
        keyword = "#FB7385",
        string = "#E5BC66",
        number = "#CE95B8",
        function_name = "#98C379",
        constant = "#3B7B9B",
        type = "#61AFEF",
        interface = "#379AEF",
        line_nr = "#8D8F9A",
        line_nr_cursor = "#574356",
        error = "#FF4E4E",
        warning = "#EDA726",
        info = "#287BDE",
        hint = "#98C379",
        diff_add = "#DFFF9F",
        diff_delete = "#FF8080",
        diff_text = "#FFDBBB",
        border = "#D5D5DB",
        indent_guide = "#D5D5DB",
        statusline_bg = "#E3E3E3",
        statusline_fg = "#595959",
        pmenu_bg = "#F2F2F2",
        pmenu_fg = "#383A3F",
        pmenu_select = "#E5DEFF",
        visual_bg = "#E5DEFF",
    }
}

return M
