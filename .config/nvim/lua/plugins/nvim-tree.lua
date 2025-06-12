local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "?", api.tree.toggle_help, opts('Help'))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Edit Or Open"))
    vim.keymap.set(
        "n",
        "e",
        function()
            api.tree.find_file({buf = vim.fn.bufnr("#")})
        end,
        opts("Focus opened file")
    )
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        version = false,
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                on_attach = my_on_attach,
                renderer = {
                    full_name = true,
                },
                view = {
                    width = 50,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>e", "<cmd>NvimTreeToggle<cr>",
            },
        },
    },
}

