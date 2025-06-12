local M = {}

function M.get_selected_text()
    local lines = vim.fn.getregion(
        vim.fn.getpos("."),
        vim.fn.getpos("v"),
        { type = vim.fn.mode() }
    )

    return table.concat(lines)
end

return M

