return {
    {
        "lukas-reineke/indent-blankline.nvim",
        version = false,
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = {
                char = "▏",
            },
            scope = {
                -- Hide underline on the first line of scope
                show_start = false,
                -- Hide underline on the last line of scope
                show_end = false,
                include = {
                    -- Make every node type as valid scope
                    node_type = { ["*"] = { "*" } },
                },
            },
        },
    }
}
